//
//  DepositCalculatorBrain.swift
//  DepositCalculator
//
//  Created by Usman Hasan on 10/8/17.
//  Copyright © 2017 Hasan Corporation. All rights reserved.
//

import Foundation
import UIKit

struct DepositCalculatorBrain {
    
    //uses the parameters to calculate the dollar value for any given denomination
    func calculateDollarValue(numberOfBills: Double, denominationOfBills: Double) -> Double {
        let totalDollarValue = numberOfBills * denominationOfBills
        return totalDollarValue
    }
    
    //uses the paramters to calculate the coin value for any given coin denomination
    func calculateCoinsValue(numberOfBills: Double, denominationOfCoins: Double) -> Double {
        let totalCoinValue = (numberOfBills * denominationOfCoins)/100
        return totalCoinValue
    }
    
    //checks the textField to make sure that the value is a double, if not it returns 0, also checks for nil
    func checkforDouble(check: String?) -> Bool {
        if Double(check!) != nil {
            return true
        }
        if Double(check!) == nil {
            return false
        }
        else {
            return false
        }
    }
    
    //brings together the calculation with the nil/double value check to compute the final value
    func provideDollarAmount (dollar: String?, denomination: String?) -> Double {
        if checkforDouble(check: dollar!) == true {
            return calculateDollarValue(numberOfBills: Double(dollar!)!, denominationOfBills: Double(denomination!)!)
        } else {
            return 0.0
        }
    }
    
    //brings together the calculation with the nil/double calue check to compute the final coin value
    func provideCoinAmount (coin: String?, denomination: String?) -> Double {
        if checkforDouble(check: coin!) == true {
            return calculateCoinsValue(numberOfBills: Double(coin!)!, denominationOfCoins: Double(denomination!)!)
        } else {
            return 0.0
        }
    }
   
    //calculates the variance between the EstimatedDeposit and the GrandTotal
    func provideVariance (depositValue: String?, finalTotal: Double) -> Double {
        if checkforDouble(check: depositValue) == true {
            return finalTotal - Double(depositValue!)!
        }
        else {
            return finalTotal
        }
        
    }
    
    //Variance shows up as green if its $0 (favorable result), otherwise its red if the estimated deposit varies from the actual deposit
    func changesVarianceColorBasedOnValue (value: Double) -> UIColor {
        if (value == 0.0) {
            return UIColor.green
        }
        else {
            return UIColor.red
        }
    }
  
}
