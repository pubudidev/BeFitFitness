//
//  ColletionTableViewCell.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/18/23.
//

import UIKit

// represent a cell of table
class ColletionTableViewCell: UITableViewCell {
    
    // to identify this UITableViewCell
    static let identifire = "ColletionViewTableViewCell"
    private var exersices: [Exersice] = [Exersice]()
    
    private let collectionView: UICollectionView = {
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectioView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectioView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // override the init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with titles: [Exersice]) {
        self.exersices = titles
		
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ColletionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    // 10 from left to right
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
}
