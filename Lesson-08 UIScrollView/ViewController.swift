//
//  ViewController.swift
//  Lesson-08 UIScrollView
//
//  Created by Adam的Apple on 2024/4/23.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    var scrollView:UIScrollView!
    var currentPageIndex = 0
    let numberOfPages = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        //addScrollView()
        addScrollView2()
    }

    func addScrollView() {
        //创建ScrollView
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        //设置可滚动区域的大小
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        //添加内容到ScrollView
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
        label.text = "Scroll me!"
        label.font = UIFont.systemFont(ofSize: 30)
        scrollView.addSubview(label)
        //启动滚动
        scrollView.isScrollEnabled = true
        //显示垂直滚动条
        scrollView.showsVerticalScrollIndicator = true
        //不显示水平滚动条
        scrollView.showsHorizontalScrollIndicator = false
        //将UIScrollView添加到视图
        view.addSubview(scrollView)
    }

    func addScrollView2() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(numberOfPages), height: view.frame.height)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        view.addSubview(scrollView)

        for i in 0..<numberOfPages {
        let pageView = UIView(frame: CGRect(x: CGFloat(i) * view.frame.width, y: 0, width: view.frame.width, height: view.frame.height))
            pageView.backgroundColor = [.red,.green,.blue][i]
        // 每个页面的背景色不同
        scrollView.addSubview(pageView)

        // 在每个页面上添加一个标签，显示页面索引
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.center = CGPoint(x: pageView.bounds.midX, y: pageView.bounds.midY)
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Page \(i + 1)"
        pageView.addSubview(label)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        currentPageIndex = currentPage
    }


}

