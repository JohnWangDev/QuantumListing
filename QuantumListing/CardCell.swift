//
//  CardCell.swift
//  QuantumListing
//
//  Created by Colin Taylor on 6/19/17.
//  Copyright © 2017 lucky clover. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    var index: Int?
    var listing_id: String?
    var listing_contacts: String?
    var listing_website: String?
    var listing_phone: String?
    var listing_email: String?
    var isHaveContact: Bool?
    var is_Owner: Bool?
    var delegate: ListingCellDelegate?
    var isBEditable: Bool?
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var kiTitle: UILabel!
    @IBOutlet weak var buttonAddress: UIButton!
    @IBOutlet weak var lblLeaseType: UILabel!
    @IBOutlet weak var lblRentPSF: UILabel!
    @IBOutlet weak var ivListing: UIImageView!
    @IBOutlet weak var txtEditTitle: UITextField!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var vwPortrait: UIView!
    @IBOutlet weak var ivAvartar: UIImageView!
    @IBOutlet weak var ivPortrait: UIImageView!
    @IBOutlet weak var lblSQFT: UILabel!
    @IBOutlet weak var lblAssetType: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var btnFavorite: UIButton!
    

    @IBAction func actUser(_ sender: Any) {
        self.delegate?.didPressedUserIndex(self.index!)
    }
    
    @IBAction func actReport(_ sender: Any) {
        self.delegate?.didPressedActionButton(self.index!)
    }
    
    @IBAction func onAddress(_ sender: Any) {
        self.delegate?.didPressedAddressIndex(self.index!)
    }

    @IBAction func actFavorite(_ sender: Any) {
        self.delegate?.didPressedLikeButton(self.index!)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setImageURL(imageURL: String) {
        
        self.ivListing.setShowActivityIndicator(true)
        self.ivListing.setIndicatorStyle(.gray)
        self.ivListing.sd_setImage(with: URL(string: imageURL)!)
    }
    
    func setAvatarImageURL(imageURL: String)
    {
        self.ivAvartar.sd_setImage(with: URL(string: imageURL)!)
        self.ivAvartar.setShowActivityIndicator(true)
        self.ivAvartar.setIndicatorStyle(.gray)
        
    }
    
    func setHaveContact(hc: Bool) {
        isHaveContact = hc
    }
    
    func configureCell() {
        vwPortrait.layer.cornerRadius = vwPortrait.bounds.width / 2.0
        vwPortrait.layer.masksToBounds = true

        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = Utilities.borderGrayColor.cgColor
        
        bgView.layer.shadowColor = UIColor.gray.cgColor
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowRadius = 4.0
        bgView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 4
        
        self.selectionStyle = .none
    }
    @IBAction func actEmail(_ sender: Any) {
        if (self.listing_email != nil) {
            UIApplication.shared.open(URL(string: "mailto:\(self.listing_email!)")!, options: [:], completionHandler: nil)
        }
        else {
            let alert = UIAlertController(title: "QuantumListing", message: "Sorry, no valid email address has been entered.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func actPhone(_ sender: Any) {
        if (self.listing_phone != nil) {
            listing_phone = listing_phone?.replacingOccurrences(of: ":", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "+", with: "").replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
            UIApplication.shared.open(URL(string: "tel:\(self.listing_phone!)")!, options: [:], completionHandler: nil)
        }
        else {
            let alert = UIAlertController(title: "QuantumListing", message: "Sorry, no valid phone number has been entered.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func actWebsite(_ sender: Any) {
        if (self.listing_website != nil) && (self.listing_website?.characters.count ?? 0) > 4 {
            if (self.listing_website?.substring(to: (self.listing_website?.index((self.listing_website?.startIndex)!, offsetBy: 4))!) == "http") {
                UIApplication.shared.open(URL(string: self.listing_website!)!, options: [:], completionHandler: nil)
            }
            else {
                UIApplication.shared.open(URL(string: "http://\(self.listing_website!)")!, options: [:], completionHandler: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "QuantumListing", message: "Sorry, no valid website address has been entered.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
            
        }
    }
}
