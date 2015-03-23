//
//  ViewController.swift
//  BlackJack
//
//  Created by Student on 2/14/15.
//  Copyright (c) 2015 XiaoZhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numDeck: Int = Int()
    var betmoney = 0
    var betmoney2 = 0
    var dscore = 0
    var pscore = 0
    var pscore2 = 0
    var gamecount = 0
    var newshoe: shoe!
    var newdealer: dealer!
    var fplayer: player!
    var splayer: player!
    var initmoney = 100
    var initmoney2 = 100
    var cardnum = 0
    var playernum = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newshoe = shoe(decknum: numDeck)
        newdealer = dealer(dcard: [],dscore: 0)
        fplayer = player(pcard: [],pscore: 0, pmoney: 100)
        splayer = player(pcard: [],pscore: 0, pmoney: 100)
        yourmoney.text = "Money: \(fplayer.pmoney)"
        yourmoney2.text = "Money: \(splayer.pmoney)"
        hit.hidden = true
        stand.hidden = true
        total.hidden = true
        gameover.hidden = true
        total2.hidden = true
        dtotal.hidden = true
        yourbet.hidden = true
        yourbet2.hidden = true
        gameover.hidden = true
        
        dimage1.hidden = true
        dimage2.hidden = true
        dimage3.hidden = true
        dimage4.hidden = true
        dimage5.hidden = true
        dimage6.hidden = true
        pimage1.hidden = true
        pimage2.hidden = true
        pimage3.hidden = true
        pimage4.hidden = true
        pimage5.hidden = true
        pimage6.hidden = true
        aimage1.hidden = true
        aimage2.hidden = true
        aimage3.hidden = true
        aimage4.hidden = true
        aimage5.hidden = true
        aimage6.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var dimage1: UIImageView!
    @IBOutlet weak var dimage2: UIImageView!
    @IBOutlet weak var dimage3: UIImageView!
    @IBOutlet weak var dimage4: UIImageView!
    @IBOutlet weak var dimage5: UIImageView!
    @IBOutlet weak var dimage6: UIImageView!
    @IBOutlet weak var pimage1: UIImageView!
    @IBOutlet weak var pimage2: UIImageView!
    @IBOutlet weak var pimage3: UIImageView!
    @IBOutlet weak var pimage4: UIImageView!
    @IBOutlet weak var pimage5: UIImageView!
    @IBOutlet weak var pimage6: UIImageView!
    @IBOutlet weak var aimage1: UIImageView!
    @IBOutlet weak var aimage2: UIImageView!
    @IBOutlet weak var aimage3: UIImageView!
    @IBOutlet weak var aimage4: UIImageView!
    @IBOutlet weak var aimage5: UIImageView!
    @IBOutlet weak var aimage6: UIImageView!
    @IBOutlet weak var yourmoney: UILabel!
    @IBOutlet weak var yourmoney2: UILabel!
    @IBOutlet weak var inputmoney: UITextField!
    @IBOutlet weak var yourbet: UILabel!
    @IBOutlet weak var yourbet2: UILabel!
    @IBOutlet weak var hit: UIButton!
    @IBOutlet weak var gameover: UIButton!
    @IBOutlet weak var dtotal: UILabel!
    @IBOutlet weak var conclusion: UILabel!
    @IBOutlet weak var conclusion2: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var total2: UILabel!
    @IBOutlet weak var stand: UIButton!
    @IBOutlet weak var Deal: UIButton!
    @IBOutlet weak var inputbet: UILabel!
    @IBAction func Deal(sender: AnyObject) {
        // clear player and dealer cards
        newdealer.dcard.removeAll(keepCapacity: false)
        fplayer.pcard.removeAll(keepCapacity: false)
        
        dimage1.hidden = true
        dimage2.hidden = true
        dimage3.hidden = true
        dimage4.hidden = true
        dimage5.hidden = true
        dimage6.hidden = true
        pimage1.hidden = true
        pimage2.hidden = true
        pimage3.hidden = true
        pimage4.hidden = true
        pimage5.hidden = true
        pimage6.hidden = true
        if (playernum == 2){
        splayer.pcard.removeAll(keepCapacity: false)
        aimage1.hidden = true
        aimage2.hidden = true
        aimage3.hidden = true
        aimage4.hidden = true
        aimage5.hidden = true
        aimage6.hidden = true
        }
        // add new card to player and dealer
        fplayer.pcard.append(fplayer.addcard(newshoe.shoecard))
        fplayer.pcard.append(fplayer.addcard(newshoe.shoecard))
        newdealer.dcard.append(newdealer.addcard(newshoe.shoecard))
        newdealer.dcard.append(newdealer.addcard(newshoe.shoecard))
        cardnum = 2
        
        // check input betmoney
        if (toDouble(inputmoney.text) == nil){
            let alertController = UIAlertController(title: "Warning", message: "Error input", preferredStyle:UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        betmoney = inputmoney.text.toInt()!
        if (betmoney < 1 || betmoney > fplayer.pmoney){
            let alertController = UIAlertController(title: "Warning", message: "Error input", preferredStyle:UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        // show bet money
        yourbet.text = "Bet: \(betmoney)"
        fplayer.pmoney = fplayer.pmoney - betmoney
        initmoney = fplayer.pmoney
        yourmoney.text = "Money: \(fplayer.pmoney)"
        Deal.hidden = true
        inputmoney.hidden = true
        yourbet.hidden = false
        inputbet.hidden = true
        hit.hidden = false
        stand.hidden = false
        total.hidden = false
        dtotal.hidden = true
        hit.hidden = false
        stand.hidden = false
        total.hidden = false
        dtotal.hidden = true
        pscore = fplayer.caculatescore(fplayer.pcard)
        dscore = newdealer.caculatescore(newdealer.dcard)
        total.text = "Total: \(pscore)"
        dtotal.text = "Total: \(dscore)"
        dimage1.image = UIImage(named:"red_joker")
        dimage2.image = UIImage(named:"\(newdealer.dcard[1].description)")
        pimage1.image = UIImage(named:"\(fplayer.pcard[0].description)")
        pimage2.image = UIImage(named:"\(fplayer.pcard[1].description)")
        
        dimage1.hidden = false
        dimage2.hidden = false
        pimage1.hidden = false
        pimage2.hidden = false

        
        if (playernum == 2){
            splayer.pcard.append(splayer.addcard(newshoe.shoecard))
            splayer.pcard.append(splayer.addcard(newshoe.shoecard))
            betmoney2 = 20
            yourbet2.text = "Bet: \(betmoney2)"
            splayer.pmoney = splayer.pmoney - betmoney2
            initmoney2 = splayer.pmoney
            yourmoney2.text = "Money: \(splayer.pmoney)"
            pscore2 = splayer.caculatescore(splayer.pcard)
            total2.text = "Total: \(pscore2)"
            total2.hidden = false
            yourbet2.hidden = false
            total2.text = "Total: \(pscore2)"
            aimage1.image = UIImage(named:"\(splayer.pcard[0].description)")
            aimage2.image = UIImage(named:"\(splayer.pcard[1].description)")
            aimage1.hidden = false
            aimage2.hidden = false
            
            if (pscore2 == 21 && dscore != 21){
                conclusion2.text = "You won"
                conclusion2.hidden = false
            }
            else if (dscore == 21 && pscore2 != 21){
                conclusion2.text = "You lose"
                conclusion2.hidden = false
            }else if (dscore == 21 && dscore == pscore2){
                conclusion2.text = "push"
                conclusion2.hidden = false
            }else{
                conclusion2.hidden = true
            }
        }
        
       
        if (pscore == 21 && dscore != 21){
            conclusion.text = "You won"
            stopgame()
        }
        else if (dscore == 21 && pscore != 21){
            conclusion.text = "You lose"
            stopgame()
        }else if (dscore == 21 && dscore == pscore){
            conclusion.text = "push"
            stopgame()
        }else{
            conclusion.hidden = true
        }
        
        
        
    }
    
    @IBAction func restart(sender: AnyObject) {
        betmoney = 0
        betmoney2 = 0
        dscore = 0
        pscore = 0
        pscore2 = 0
        gamecount = 0
        initmoney = 100
        initmoney2 = 100
        playernum = 2
        gameover.hidden = true
        Deal.hidden = false
        inputmoney.hidden = false
        inputbet.hidden = false
        yourbet.hidden = true
        conclusion.text = "Let's play blackjack"
        conclusion2.text = "Let's play blackjack"
        yourbet2.hidden = true
        dimage1.hidden = true
        dimage2.hidden = true
        dimage3.hidden = true
        dimage4.hidden = true
        dimage5.hidden = true
        dimage6.hidden = true
        pimage1.hidden = true
        pimage2.hidden = true
        pimage3.hidden = true
        pimage4.hidden = true
        pimage5.hidden = true
        pimage6.hidden = true
        aimage1.hidden = true
        aimage2.hidden = true
        aimage3.hidden = true
        aimage4.hidden = true
        aimage5.hidden = true
        aimage6.hidden = true
        viewDidLoad()
    }
    
    @IBAction func Hit(sender: UIButton) {
        fplayer.pcard.append(fplayer.addcard(newshoe.shoecard))
        cardnum += 1
        if ((fplayer.pcard.count) == 3){
            self.pimage3.image = UIImage(named:"\(self.fplayer.pcard[self.fplayer.pcard.count-1].description)")
            pimage3.hidden = false
        }
        if ((fplayer.pcard.count) == 4){
            self.pimage4.image = UIImage(named:"\(self.fplayer.pcard[self.fplayer.pcard.count-1].description)")
            pimage4.hidden = false
        }
        if ((fplayer.pcard.count) == 5){
            self.pimage5.image = UIImage(named:"\(self.fplayer.pcard[self.fplayer.pcard.count-1].description)")
            pimage5.hidden = false
        }
        if ((fplayer.pcard.count) == 6){
            self.pimage5.image = UIImage(named:"\(self.fplayer.pcard[self.fplayer.pcard.count-1].description)")
            pimage6.hidden = false
        }
        pscore = fplayer.caculatescore(fplayer.pcard)
        total.text = "Total: \(pscore)"
        if (pscore > 21){
            conclusion.text = "You lose"
            conclusion.hidden = false
            stopgame()
        }
        if (cardnum == 6){
            hit.hidden = true
            stand.hidden = true
            stopgame()
        }
        
    }

    
    @IBAction func Stand(sender: AnyObject) {
        hit.hidden = true
        stand.hidden = true
        stopgame()
    }
    
    
    
    func showdealer(){
        dimage1.image = UIImage(named:"\(newdealer.dcard[0].description)")
        if ((newdealer.dcard.count) == 3){
            self.dimage3.image = UIImage(named:"\(self.newdealer.dcard[self.newdealer.dcard.count-1].description)")
            dimage3.hidden = false
        }
        if ((newdealer.dcard.count) == 4){
            self.dimage4.image = UIImage(named:"\(self.newdealer.dcard[self.newdealer.dcard.count-1].description)")
            dimage4.hidden = false
        }
        if ((newdealer.dcard.count) == 5){
            self.dimage5.image = UIImage(named:"\(self.newdealer.dcard[self.newdealer.dcard.count-1].description)")
            dimage5.hidden = false
        }
        if ((newdealer.dcard.count) == 6){
            self.dimage5.image = UIImage(named:"\(self.newdealer.dcard[self.newdealer.dcard.count-1].description)")
            dimage6.hidden = false
        }
    }
    
    func stopgame (){
        // show dealer card
        while (pscore2 < 17 && splayer.pcard.count < 7 && playernum == 2){
            splayer.pcard.append(splayer.addcard(newshoe.shoecard))
            pscore2 = splayer.caculatescore(splayer.pcard)
            if ((splayer.pcard.count) == 3){
                self.aimage3.image = UIImage(named:"\(self.splayer.pcard[self.splayer.pcard.count-1].description)")
                aimage3.hidden = false
            }
            if ((splayer.pcard.count) == 4){
                self.aimage3.image = UIImage(named:"\(self.splayer.pcard[self.splayer.pcard.count-1].description)")
                aimage3.hidden = false
            }
            if ((splayer.pcard.count) == 5){
                self.aimage3.image = UIImage(named:"\(self.splayer.pcard[self.splayer.pcard.count-1].description)")
                aimage3.hidden = false
            }
            if ((splayer.pcard.count) == 6){
                self.aimage3.image = UIImage(named:"\(self.splayer.pcard[self.splayer.pcard.count-1].description)")
                aimage3.hidden = false
            }
        }
        
        pscore = fplayer.caculatescore(fplayer.pcard)
        pscore2 = splayer.caculatescore(splayer.pcard)
        
        while (dscore < 17 && newdealer.dcard.count < 7 && (pscore < 22 || pscore2 < 22)){
            newdealer.dcard.append(newdealer.addcard(newshoe.shoecard))
            dscore = newdealer.caculatescore(newdealer.dcard)
        }
        
        dscore = newdealer.caculatescore(newdealer.dcard)
        
        if (conclusion.hidden == true){
            if (dscore > 21){
                conclusion.text = "You won"
            }
            else if (pscore > dscore){
                conclusion.text = "You won"
            }
            else if (pscore < dscore){
                conclusion.text = "You lose"
            }
            else{
                conclusion.text = "Push"
            }
        }
        
        if (conclusion2.hidden == true){
            if (dscore > 21 && pscore2 < 22){
                conclusion2.text = "You won"
            }
            else if (pscore2 > dscore && pscore2 < 22){
                conclusion2.text = "You won"
            }
            else if (pscore2 < dscore && pscore2 < 22){
                conclusion2.text = "You lose"
            }
            else if (pscore2 > 22){
                conclusion2.text = "You lose"
            }
            else{
                conclusion2.text = "Push"
            }
        }
        
        showdealer()
        conclusion.hidden = false

        Deal.hidden = false
        inputmoney.hidden = false
        yourbet.hidden = true
        inputbet.hidden = false
        stand.hidden = true
        dtotal.hidden = false
        dtotal.text = "Total: \(dscore)"
        conclusion2.hidden = false
        yourbet2.hidden = true
        total2.text = "Total: \(pscore2)"
        // result
        if (conclusion.text == "You lose"){
        }else if (conclusion.text == "You won"){
            fplayer.pmoney += betmoney*2
        }else if (conclusion.text == "Push"){
            fplayer.pmoney += betmoney
        }
        yourmoney.text = "Money: \(fplayer.pmoney)"
        
        if (conclusion2.text == "You lose"){
        }else if (conclusion2.text == "You won"){
            splayer.pmoney += betmoney2*2
        }else if (conclusion2.text == "Push"){
            splayer.pmoney += betmoney2
        }
        yourmoney2.text = "Money: \(splayer.pmoney)"
        
        if (splayer.pmoney < 1){
            yourbet2.text = "Game Over"
            yourbet2.hidden = false
            playernum -= 1
            pscore2 = 22
        }
        
        if (fplayer.pmoney < 1){
            Deal.hidden = true
            hit.hidden = true
            stand.hidden = true
            inputmoney.hidden = true
            inputbet.hidden = true
            yourbet.text = "Game Over"
            yourbet.hidden = false
            gameover.hidden = false
        }
        
        // shuffle if game count > 4
        gamecount += 1
        if (gamecount > 4){
            gamecount = 0
            newshoe.initshoe(3)
        }
        
    }
    
    func toDouble(str: String) -> Double? {
        var formatter = NSNumberFormatter()
        if let number = formatter.numberFromString(str) {
            return number.doubleValue
        }
        return nil
    }
    
    
    
}

