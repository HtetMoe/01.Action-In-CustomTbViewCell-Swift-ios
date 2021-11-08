//
//  TableViewCell.swift
//  ActionInTableViewCell
//
//  Created by Htet Moe Phyu on 08/11/2021.
//

import UIKit

//deligate
protocol MyTableViewCellDeligate : AnyObject{
    func didTapButton(with title : String)
}

class TableViewCell: UITableViewCell {

    weak var deligate : MyTableViewCellDeligate?
    
    //nib
    static let identifier = "Cell"
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    //outlets
    @IBOutlet var button: UIButton!
    
    //variables
    private var title : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        deligate?.didTapButton(with: title)
    }
    
    //data setup
    func configure(with title : String){
        self.title = title
        button.setTitle(title, for: .normal)
    }
}
