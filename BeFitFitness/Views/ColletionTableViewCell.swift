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
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
