//
//  ViewController.swift
//  twitter_start
//
//  Created by Artem Grebinik on 10.02.2018.
//  Copyright © 2018 Artem Hrebinik. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Twitter Feed"
        collectionView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(MyCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCell
        cell.textView.text = "Twitter Status uUpdate \(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize(width: view.frame.width, height: 80)
    }
}

class MyCell: UICollectionViewCell {
    
    var textView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        return textView
    }()
    
    var deviderView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(textView)
        addSubview(deviderView)
        
        addConstraints(with: "H:|[v0]|", textView)
        addConstraints(with: "V:|[v0]|", textView)
        
        addConstraints(with: "H:|-8-[v0]|", deviderView)
        addConstraints(with: "V:[v0(1)]|", deviderView)
    }
}

extension UIView {
    
    func addConstraints(with format: String, _ views: UIView...) {
        var viewsDictionary = [String : UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                     options: NSLayoutFormatOptions(),
                                                     metrics: nil,
                                                     views: viewsDictionary))
    }
}




