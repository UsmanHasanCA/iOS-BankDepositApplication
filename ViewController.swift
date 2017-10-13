//
//  ViewController.swift
//  DepositCalculator
//
//  Created by Usman Hasan on 10/7/17.
//  Copyright © 2017 Hasan Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var OneDollarCountToValue: UILabel!
    @IBOutlet weak var OneDollarLabel: UILabel!
    @IBOutlet weak var OneDollar: UITextField!
    
    @IBOutlet weak var TwoDollarCountToValue: UILabel!
    @IBOutlet weak var TwoDollarLabel: UILabel!
    @IBOutlet weak var TwoDollar: UITextField!
    
    @IBOutlet weak var FiveDollarCountToValue: UILabel!
    @IBOutlet weak var FiveDollarLabel: UILabel!
    @IBOutlet weak var FiveDollar: UITextField!
    
    @IBOutlet weak var TenDollarCountToValue: UILabel!
    @IBOutlet weak var TenDollarLabel: UILabel!
    @IBOutlet weak var TenDollar: UITextField!
    
    @IBOutlet weak var TwentyDollarCountToValue: UILabel!
    @IBOutlet weak var TwentyDollarLabel: UILabel!
    @IBOutlet weak var TwentyDollar: UITextField!
    
    @IBOutlet weak var FiftyDollarCountToValue: UILabel!
    @IBOutlet weak var FiftyDollarLabel: UILabel!
    @IBOutlet weak var FiftyDollar: UITextField!
    
    @IBOutlet weak var OneHundredDollarCountToValue: UILabel!
    @IBOutlet weak var OneHundredDollarLabel: UILabel!
    @IBOutlet weak var OneHundredDollar: UITextField!
    
    @IBOutlet weak var PenniesCountToValue: UILabel!
    @IBOutlet weak var PenniesLabel: UILabel!
    @IBOutlet weak var Pennies: UITextField!
    
    @IBOutlet weak var NickelsCountToValue: UILabel!
    @IBOutlet weak var NickelsLabel: UILabel!
    @IBOutlet weak var Nickels: UITextField!
    
    @IBOutlet weak var DimesCountToValue: UILabel!
    @IBOutlet weak var DimesLabel: UILabel!
    @IBOutlet weak var Dimes: UITextField!
    
    @IBOutlet weak var QuartersCountToValue: UILabel!
    @IBOutlet weak var QuartersLabel: UILabel!
    @IBOutlet weak var Quarters: UITextField!
    
    @IBOutlet weak var HalfDollarCountToValue: UILabel!
    @IBOutlet weak var HalfDollarLabel: UILabel!
    @IBOutlet weak var HalfDollar: UITextField!
    
    @IBOutlet weak var GrandTotal: UILabel!
    @IBOutlet weak var Variance: UILabel!
    @IBOutlet weak var EstimatedDeposit: UITextField!
    
    //makes the keyboard disappear when the user clicks anyhwere else on the screen
    override func viewDidLoad() {
        super.viewDidLoad()
        self.OneDollar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private var dcb = DepositCalculatorBrain()
    
    @IBAction func CalculateTotalDeposit(_ sender: UIButton) {
        let OneDollarValue = dcb.provideDollarAmount(dollar: OneDollar.text, denomination: OneDollarLabel.text)
        let TwoDollarValue = dcb.provideDollarAmount(dollar: TwoDollar.text, denomination: TwoDollarLabel.text)
        let FiveDollarValue = dcb.provideDollarAmount(dollar: FiveDollar.text, denomination: FiveDollarLabel.text)
        let TenDollarValue = dcb.provideDollarAmount(dollar: TenDollar.text, denomination: TenDollarLabel.text)
        let TwentyDollarValue = dcb.provideDollarAmount(dollar: TwentyDollar.text, denomination: TwentyDollarLabel.text)
        let FiftyDollarValue = dcb.provideDollarAmount(dollar: FiftyDollar.text, denomination: FiftyDollarLabel.text)
        let OneHundredDollarValue = dcb.provideDollarAmount(dollar: OneHundredDollar.text, denomination: OneHundredDollarLabel.text)
        let PenniesValue = dcb.provideCoinAmount(coin: Pennies.text, denomination: PenniesLabel.text)
        let NickelsValue = dcb.provideCoinAmount(coin: Nickels.text, denomination: NickelsLabel.text)
        let DimesValue = dcb.provideCoinAmount(coin: Dimes.text, denomination: DimesLabel.text)
        let QuartersValue = dcb.provideCoinAmount(coin: Quarters.text, denomination: QuartersLabel.text)
        let HalfDollarValue = dcb.provideCoinAmount(coin: HalfDollar.text, denomination: HalfDollarLabel.text)
        
        //finds sum of all variables
        let total = OneDollarValue + TwoDollarValue + FiveDollarValue + TenDollarValue + TwentyDollarValue + FiftyDollarValue + OneHundredDollarValue + PenniesValue + NickelsValue + DimesValue + QuartersValue + HalfDollarValue
        
        let VarianceAmount = dcb.provideVariance(depositValue: EstimatedDeposit.text, finalTotal: total)
        
        //rounding all the coins, grand total, and variance
        let PenniesAmountRounded = String(format: "%.2f", arguments: [PenniesValue])
        let NickelsAmountRounded = String(format: "%.2f", arguments: [NickelsValue])
        let DimesAmountRounded = String(format: "%.2f", arguments: [DimesValue])
        let QuartersAmountRounded = String(format: "%.2f", arguments: [QuartersValue])
        let HalfDollarAmountRounded = String(format: "%.2f", arguments: [HalfDollarValue])
        let GrandTotalAmountRounded = String(format: "%.2f", arguments: [total])
        let VarianceAmountRounded = String(format: "%.2f", arguments: [VarianceAmount])
        
        //printing to final label at the bottom
        
        //Bills
        OneDollarCountToValue.text = "$\(OneDollarValue)0"
        TwoDollarCountToValue.text = "$\(TwoDollarValue)0"
        FiveDollarCountToValue.text = "$\(FiveDollarValue)0"
        TenDollarCountToValue.text = "$\(TenDollarValue)0"
        TwentyDollarCountToValue.text = "$\(TwentyDollarValue)0"
        FiftyDollarCountToValue.text = "$\(FiftyDollarValue)0"
        OneHundredDollarCountToValue.text = "$\(OneHundredDollarValue)0"
        
        //Coins
        PenniesCountToValue.text = "$\(PenniesAmountRounded)"
        NickelsCountToValue.text = "$\(NickelsAmountRounded)"
        DimesCountToValue.text = "$\(DimesAmountRounded)"
        QuartersCountToValue.text = "$\(QuartersAmountRounded)"
        HalfDollarCountToValue.text = "$\(HalfDollarAmountRounded)"
        
        //Totals
        GrandTotal.text = "$\(GrandTotalAmountRounded)"
        Variance.text = "$\(VarianceAmountRounded)"
        Variance.textColor = dcb.changesVarianceColorBasedOnValue(value: VarianceAmount)
        
        //exit keyboard after submit is hit
        self.view.endEditing(true)
        
    }
    
    
    
}

