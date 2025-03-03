//
//  ViewController.swift
//  SliderScreen
//
//  Created by KAMA . on 03.03.2025.
//

import UIKit

class ViewController: UIViewController {

    let collectionData = SliderItem.mockData()

    lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height + 100)

        $0.register(SliderCell.self, forCellWithReuseIdentifier: SliderCell.reuseId)
        $0.isPagingEnabled = true
        $0.dataSource = self

        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCell.reuseId, for: indexPath) as! SliderCell

        let sliderItems = collectionData[indexPath.item]
        let imageName = sliderItems.image
        let textLabel = sliderItems.text
        let textColor = sliderItems.textColor

        cell.setImageView(image: imageName)
        cell.addTextLabel(text: textLabel, textColor: textColor)

        if indexPath.item == collectionData.count - 1 {
            cell.addLoginBtn()
        }

        return cell
    }
}

import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

// PreviewProvider для SwiftUI
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
        //            .previewLayout(.sizeThatFits)
    }
}
