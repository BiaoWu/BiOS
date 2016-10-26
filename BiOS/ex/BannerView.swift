//
//  BannerView.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/24.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class BannerView: UIView {
    
    // MARK: - Property
    
    var scrollView: UIScrollView!
    
    var imageViews = [UIImageView]()
    
    var pageIndicator: UIPageControl!
    
    var images: [UIImage?]? {
        didSet {
            guard let images = images , images.count > 0 else {
                print("Are you kidding me?")
                return
            }
            
            let count = images.count
            pageIndicator.numberOfPages = count
            
            setUpImageViews()
            setNeedsLayout()
            updateImageViews(images)
        }
    }
    
    var currentOffsetX: CGFloat!
    
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }
    
    // MARK: - Privite Methods
    
    fileprivate func setUpView() {
        setUpScrollView()
        setUpPageIndicator()
    }
    
    fileprivate func setUpScrollView() {
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        
        self.addSubview(scrollView)
    }
    
    fileprivate func setUpImageViews() {
        if let images = images {
            var imageView: UIImageView!
            for _ in 0..<images.count + 2 {
                imageView = UIImageView()
                imageViews.append(imageView)
                setUpImageView(imageView)
            }
        }
    }
    
    fileprivate func updateImageViews(_ images: [UIImage?]) {
        imageViews[0].image = images[images.count - 1]
        imageViews[imageViews.count - 1].image = images[0]
        
        for i in 1...images.count {
            imageViews[i].image = images[i - 1]
        }
    }
    
    fileprivate func setUpImageView(_ imageView: UIImageView) {
        //        imageView.userInteractionEnabled = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.backgroundColor = UIColor.orange
        imageView.clipsToBounds = true
        self.scrollView.addSubview(imageView)
    }
    
    fileprivate func setUpPageIndicator() {
        pageIndicator = UIPageControl()
        pageIndicator.pageIndicatorTintColor = UIColor.white
        pageIndicator.currentPageIndicatorTintColor = UIColor.red
        
        self.addSubview(pageIndicator)
        
        pageIndicator.translatesAutoresizingMaskIntoConstraints = false
        pageIndicator.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        pageIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        self.scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        if images?.count > 0 {
            self.scrollView.contentSize = CGSize(width: self.frame.width * CGFloat(imageViews.count), height: self.frame.height)
            self.scrollView.setContentOffset(CGPoint(x: self.frame.width, y: 0), animated: false)
            currentOffsetX = self.frame.width
            
            for i in 0..<imageViews.count {
                self.imageViews[i].frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
            }
        }
    }
}

extension BannerView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let newOffsetX = scrollView.contentOffset.x
        
        if newOffsetX == currentOffsetX {
            print("Banner no change")
            return
        }
        
        currentOffsetX = newOffsetX
        
        var newIndex = Int(newOffsetX / self.frame.width)
        
        var needChangeScrollViewContentOffset = false
        if newIndex == 0 {
            newIndex = imageViews.count - 2
            needChangeScrollViewContentOffset = true
        } else if newIndex == imageViews.count - 1 {
            newIndex = 1
            needChangeScrollViewContentOffset = true
        }
        
        pageIndicator.currentPage = newIndex - 1
        if needChangeScrollViewContentOffset {
            self.scrollView.setContentOffset(CGPoint(x: CGFloat(newIndex) * self.frame.width, y: 0), animated: false)
        }
    }
}
