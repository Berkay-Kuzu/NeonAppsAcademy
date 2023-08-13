//
//  ViewController.swift
//  Page Control
//
//  Created by Berkay Kuzu on 2.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var slides: [Slide] = []
    var currentPage = 0

    let princeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        //collectionView.backgroundColor = .red
        return collectionView
        }()
    
    let princePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.layer.cornerRadius = 15
        pageControl.backgroundColor = .systemGray6
        pageControl.currentPageIndicatorTintColor = .systemGreen
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        
        princeCollectionView.delegate = self
        princeCollectionView.dataSource = self
        
        slides = [
            Slide(title: "Title1", subtitle: "Subtitle1", image: UIImage(named: "chateau")),
            Slide(title: "Title2", subtitle: "Subtitle2", image: UIImage(named: "chateau2")),
            Slide(title: "Title3", subtitle: "Subtitle3", image: UIImage(named: "chateau3"))
        ]
        
        princeCollectionView.register(SlideCollectionViewCell.self, forCellWithReuseIdentifier: SlideCollectionViewCell.identifier)
        
        princePageControl.numberOfPages = slides.count
    }
    
    private func addSubviews() {
        view.addSubview(princeCollectionView)
        view.addSubview(princePageControl)
    }

    private func applyConstraints() {
        princeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view).offset(-200)
        }
        princePageControl.snp.makeConstraints { make in
            make.top.equalTo(princeCollectionView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCollectionViewCell.identifier, for: indexPath) as! SlideCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        princePageControl.currentPage = currentPage
    }
    
}
