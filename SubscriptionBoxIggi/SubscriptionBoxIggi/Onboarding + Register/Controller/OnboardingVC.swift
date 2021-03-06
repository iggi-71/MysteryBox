//
//  ViewController.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 2/28/21.
//

import UIKit

class OnboardingVC: UIViewController {
    
    var pagesArray: [OnboardingPageView]!
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let container: UIStackView = {
        let container = UIStackView()
        container.axis = .horizontal
        container.spacing = 0
        container.distribution = .fillEqually
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupContainer()
        setupPages()
        setupPageControl()
    }
    
    func setupScrollView(){
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupContainer(){
        scrollView.addSubview(container)
        container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    func setupPages(){
        let firstPage = OnboardingPageView(message: "Select Which Type of Snack you are Carving for", imageName: "CCandy", backgroundColor: UIColor(named: "blue")!, isLastPage: false)
        let secondPage = OnboardingPageView(message: "Suprise in every box", imageName: "mysterybox", backgroundColor: UIColor(named: "yellow")!, isLastPage: false)
        let thirdPage = OnboardingPageView(message: "Get random items inside your mystery box", imageName: "gadgets", backgroundColor: UIColor(named: "forest")!, isLastPage: true)
        
        thirdPage.button.addTarget(self, action: #selector(goLogin), for: .touchUpInside)
        
        pagesArray = [firstPage, secondPage, thirdPage]
        
        for page in pagesArray {
            page.translatesAutoresizingMaskIntoConstraints = false
            container.addArrangedSubview(page)
            page.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        }
    }
    
    func setupPageControl(){
        pageControl.numberOfPages = pagesArray.count
        self.view.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
    }
    
    @objc func goLogin(){
        UIApplication.shared.windows.first?.rootViewController = LoginVC()
    }
}

extension OnboardingVC: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = currentPage
    }
}
