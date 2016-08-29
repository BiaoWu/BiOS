//
//  BannerView.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/24.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class BannerView: UIView {
    
    // MARK: - Property
    
    var scrollView: UIScrollView!
    
    var imageViews = [UIImageView]()
    
    var pageIndicator: UIPageControl!
    
    var images: [UIImage?]? {
        didSet {
            guard let images = images where images.count > 0 else {
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
        self.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpView()
    }
    
    // MARK: - Privite Methods
    
    private func setUpView() {
        setUpScrollView()
        setUpPageIndicator()
    }
    
    private func setUpScrollView() {
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        
        self.addSubview(scrollView)
    }
    
    private func setUpImageViews() {
        if let images = images {
            var imageView: UIImageView!
            for _ in 0..<images.count + 2 {
                imageView = UIImageView()
                imageViews.append(imageView)
                setUpImageView(imageView)
            }
        }
    }
    
    private func updateImageViews(images: [UIImage?]) {
        imageViews[0].image = images[images.count - 1]
        imageViews[imageViews.count - 1].image = images[0]
        
        for i in 1...images.count {
            imageViews[i].image = images[i - 1]
        }
    }
    
    private func setUpImageView(imageView: UIImageView) {
        //        imageView.userInteractionEnabled = true
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.backgroundColor = UIColor.orangeColor()
        imageView.clipsToBounds = true
        self.scrollView.addSubview(imageView)
    }
    
    private func setUpPageIndicator() {
        pageIndicator = UIPageControl()
        pageIndicator.pageIndicatorTintColor = UIColor.whiteColor()
        pageIndicator.currentPageIndicatorTintColor = UIColor.redColor()
        
        self.addSubview(pageIndicator)
        
        pageIndicator.translatesAutoresizingMaskIntoConstraints = false
        pageIndicator.rightAnchor.constraintEqualToAnchor(self.rightAnchor, constant: -10).active = true
        pageIndicator.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
    }
    
    override func layoutSubviews() {
        self.scrollView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        
        if images?.count > 0 {
            self.scrollView.contentSize = CGSizeMake(self.frame.width * CGFloat(imageViews.count), self.frame.height)
            self.scrollView.setContentOffset(CGPoint(x: self.frame.width, y: 0), animated: false)
            currentOffsetX = self.frame.width
            
            for i in 0..<imageViews.count {
                self.imageViews[i].frame = CGRectMake(self.frame.width * CGFloat(i), 0, self.frame.width, self.frame.height)
            }
        }
    }
}

extension BannerView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
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
