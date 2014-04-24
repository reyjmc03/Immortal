package 
{
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class GlobalUpgradeMenu extends MovieClip
    {
        public var btSaw1:MovieClip;
        public var btLightning4:MovieClip;
        public var star:MovieClip;
        public var btSaw2:MovieClip;
        public var btLightning5:MovieClip;
        public var btMachinegun3:MovieClip;
        public var hint:MovieClip;
        public var btSaw3:MovieClip;
        public var btMachinegun2:MovieClip;
        public var btUndo:MovieClip;
        public var txtStarsCount:TextField;
        public var btSaw4:MovieClip;
        public var btSaw5:MovieClip;
        public var btTower4:MovieClip;
        public var btDone:SimpleButton;
        public var mcSaw:MovieClip;
        public var btTower5:MovieClip;
        public var btTower2:MovieClip;
        public var btReset:MovieClip;
        public var btTower3:MovieClip;
        public var mcHeavygun:MovieClip;
        public var mcMachinegun:MovieClip;
        public var btHeavygun4:MovieClip;
        public var btHeavygun5:MovieClip;
        public var btTower1:MovieClip;
        public var bg:MovieClip;
        public var btHeavygun2:MovieClip;
        public var mcLightning:MovieClip;
        public var mcTower:MovieClip;
        public var btHeavygun3:MovieClip;
        public var btMachinegun5:MovieClip;
        public var btHeavygun1:MovieClip;
        public var btMachinegun4:MovieClip;
        public var btLightning1:MovieClip;
        public var btLightning2:MovieClip;
        public var btLightning3:MovieClip;
        public var btMachinegun1:MovieClip;
        private var curMouseButton:Object;
        private var hideHintObj:Object;
        private var hintMini:MovieClip;
        private var starsCount:int;
        private var indTower:int;
        private var indMachinegun:int;
        private var indHeavygun:int;
        private var indLightning:int;
        private var indSaw:int;
        private var initialized:Boolean = false;

        public function GlobalUpgradeMenu()
        {
            this.hintMini = new Hint();
            return;
        }// end function

        public function initEvents() : void
        {
            if (this.initialized)
            {
                return;
            }
            this.initialized = true;
            this.initLeftColumnMc(this.mcTower);
            this.initLeftColumnMc(this.mcMachinegun);
            this.initLeftColumnMc(this.mcHeavygun);
            this.initLeftColumnMc(this.mcLightning);
            this.initLeftColumnMc(this.mcSaw);
            addChild(this.hintMini);
            this.hintMini.txt.autoSize = TextFieldAutoSize.LEFT;
            this.btReset.addEventListener(MouseEvent.MOUSE_OVER, this.btOver, false, 0, true);
            this.btReset.addEventListener(MouseEvent.MOUSE_OUT, this.btOut, false, 0, true);
            this.btReset.addEventListener(MouseEvent.CLICK, this.btResetClick, false, 0, true);
            this.btUndo.addEventListener(MouseEvent.MOUSE_OVER, this.btOver, false, 0, true);
            this.btUndo.addEventListener(MouseEvent.MOUSE_OUT, this.btOut, false, 0, true);
            this.btUndo.addEventListener(MouseEvent.CLICK, this.btUndoClick, false, 0, true);
            this.btDone.addEventListener(MouseEvent.CLICK, this.btDoneClick, false, 0, true);
            var _loc_1:int = 0;
            while (_loc_1 < 5)
            {
                
                this.initBt(MovieClip(getChildByName("btTower" + ((_loc_1 + 1)).toString())), this.upgrTowerClick);
                this.initBt(MovieClip(getChildByName("btMachinegun" + ((_loc_1 + 1)).toString())), this.upgrMachineGunClick);
                this.initBt(MovieClip(getChildByName("btHeavygun" + ((_loc_1 + 1)).toString())), this.upgrHeavyGunClick);
                this.initBt(MovieClip(getChildByName("btLightning" + ((_loc_1 + 1)).toString())), this.upgrLightningClick);
                this.initBt(MovieClip(getChildByName("btSaw" + ((_loc_1 + 1)).toString())), this.upgrSawsClick);
                _loc_1++;
            }
            return;
        }// end function

        private function btOver(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 1)
            {
                event.currentTarget.gotoAndStop(2);
            }
            return;
        }// end function

        private function btOut(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                event.currentTarget.gotoAndStop(1);
            }
            return;
        }// end function

        private function initBt(param1:MovieClip, param2:Function) : void
        {
            param1.addEventListener(MouseEvent.CLICK, param2, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_OUT, this.hideHint, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_MOVE, this.moveHint, false, 0, true);
            return;
        }// end function

        private function btResetClick(event:MouseEvent) : void
        {
            var _loc_2:int = 0;
            while (_loc_2 < this.indTower)
            {
                
                this.starsCount = this.starsCount + Upgrades.getTowerUpgrade(_loc_2).price;
                _loc_2++;
            }
            _loc_2 = 0;
            while (_loc_2 < this.indMachinegun)
            {
                
                this.starsCount = this.starsCount + Upgrades.getMachineGunUpgrade(_loc_2).price;
                _loc_2++;
            }
            _loc_2 = 0;
            while (_loc_2 < this.indHeavygun)
            {
                
                this.starsCount = this.starsCount + Upgrades.getHeavyGunUpgrade(_loc_2).price;
                _loc_2++;
            }
            _loc_2 = 0;
            while (_loc_2 < this.indLightning)
            {
                
                this.starsCount = this.starsCount + Upgrades.getLightningUpgrade(_loc_2).price;
                _loc_2++;
            }
            _loc_2 = 0;
            while (_loc_2 < this.indSaw)
            {
                
                this.starsCount = this.starsCount + Upgrades.getSawsUpgrade(_loc_2).price;
                _loc_2++;
            }
            this.indTower = 0;
            this.indMachinegun = 0;
            this.indHeavygun = 0;
            this.indLightning = 0;
            this.indSaw = 0;
            this.refresh();
            return;
        }// end function

        private function btUndoClick(event:MouseEvent) : void
        {
            this.initialize(this.bg.currentFrame);
            return;
        }// end function

        private function refreshUndo() : void
        {
            if (this.indTower == Upgrades.towerInd && this.indMachinegun == Upgrades.machineGunInd && this.indHeavygun == Upgrades.heavyGunInd && this.indLightning == Upgrades.lightningInd && this.indSaw == Upgrades.sawsInd)
            {
                this.btUndo.gotoAndStop(3);
                this.btUndo.buttonMode = false;
            }
            else
            {
                this.btUndo.gotoAndStop(1);
                this.btUndo.buttonMode = true;
            }
            return;
        }// end function

        private function refreshReset() : void
        {
            if (this.indTower == 0 && this.indMachinegun == 0 && this.indHeavygun == 0 && this.indLightning == 0 && this.indSaw == 0)
            {
                this.btReset.gotoAndStop(3);
                this.btReset.buttonMode = false;
            }
            else
            {
                this.btReset.gotoAndStop(1);
                this.btReset.buttonMode = true;
            }
            return;
        }// end function

        private function btDoneClick(event:MouseEvent) : void
        {
            return;
        }// end function

        public function save() : void
        {
            Upgrades.setTowerUpgr(this.indTower);
            Upgrades.setMachineGunUpgr(this.indMachinegun);
            Upgrades.setHeavyGunUpgr(this.indHeavygun);
            Upgrades.setLightningUpgr(this.indLightning);
            Upgrades.setSawsUpgr(this.indSaw);
            Saves.save();
            return;
        }// end function

        public function initialize(param1:int = 1) : void
        {
            this.hint.visible = false;
            this.hintMini.visible = false;
            this.bg.gotoAndStop(param1);
            this.indTower = Upgrades.towerInd;
            this.indMachinegun = Upgrades.machineGunInd;
            this.indHeavygun = Upgrades.heavyGunInd;
            this.indLightning = Upgrades.lightningInd;
            this.indSaw = Upgrades.sawsInd;
            this.refresh();
            return;
        }// end function

        private function initLeftColumnMc(param1:MovieClip) : void
        {
            param1.addEventListener(MouseEvent.MOUSE_OVER, this.showMiniHint, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_OUT, this.hideMiniHint, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_MOVE, this.moveMiniHint, false, 0, true);
            return;
        }// end function

        private function showMiniHint(event:MouseEvent) : void
        {
            this.hintMini.visible = true;
            this.moveMiniHint(event);
            if (event.currentTarget == this.mcTower)
            {
                this.hintMini.txt.text = "Tower Upgrades";
            }
            else if (event.currentTarget == this.mcMachinegun)
            {
                this.hintMini.txt.text = "Machinegun Upgrades";
            }
            else if (event.currentTarget == this.mcHeavygun)
            {
                this.hintMini.txt.text = "Heavygun Upgrades";
            }
            else if (event.currentTarget == this.mcLightning)
            {
                this.hintMini.txt.text = "Lightning Upgrades";
            }
            else if (event.currentTarget == this.mcSaw)
            {
                this.hintMini.txt.text = "Saw Upgrades";
            }
            this.hintMini.bg.width = this.hintMini.txt.textWidth + 20;
            return;
        }// end function

        private function hideMiniHint(event:MouseEvent) : void
        {
            this.hintMini.visible = false;
            return;
        }// end function

        private function moveMiniHint(event:MouseEvent) : void
        {
            this.hintMini.x = mouseX + 5;
            this.hintMini.y = mouseY - 20;
            return;
        }// end function

        private function refresh() : void
        {
            this.calcStarsCount();
            var _loc_1:int = 0;
            while (_loc_1 < 5)
            {
                
                this.refreshUpgrade(MovieClip(getChildByName("btTower" + ((_loc_1 + 1)).toString())), _loc_1, this.indTower, Upgrades.getTowerUpgrade(_loc_1).price);
                this.refreshUpgrade(MovieClip(getChildByName("btMachinegun" + ((_loc_1 + 1)).toString())), _loc_1, this.indMachinegun, Upgrades.getMachineGunUpgrade(_loc_1).price);
                this.refreshUpgrade(MovieClip(getChildByName("btHeavygun" + ((_loc_1 + 1)).toString())), _loc_1, this.indHeavygun, Upgrades.getHeavyGunUpgrade(_loc_1).price);
                this.refreshUpgrade(MovieClip(getChildByName("btSaw" + ((_loc_1 + 1)).toString())), _loc_1, this.indSaw, Upgrades.getSawsUpgrade(_loc_1).price);
                this.refreshUpgrade(MovieClip(getChildByName("btLightning" + ((_loc_1 + 1)).toString())), _loc_1, this.indLightning, Upgrades.getLightningUpgrade(_loc_1).price);
                _loc_1++;
            }
            this.txtStarsCount.text = this.starsCount.toString();
            this.refreshUndo();
            this.refreshReset();
            return;
        }// end function

        private function calcStarsCount() : void
        {
            this.starsCount = Upgrades.starsCount;
            var _loc_1:int = 0;
            while (_loc_1 < 5)
            {
                
                if (_loc_1 < this.indTower)
                {
                    this.starsCount = this.starsCount - Upgrades.getTowerUpgrade(_loc_1).price;
                }
                if (_loc_1 < this.indMachinegun)
                {
                    this.starsCount = this.starsCount - Upgrades.getMachineGunUpgrade(_loc_1).price;
                }
                if (_loc_1 < this.indHeavygun)
                {
                    this.starsCount = this.starsCount - Upgrades.getHeavyGunUpgrade(_loc_1).price;
                }
                if (_loc_1 < this.indSaw)
                {
                    this.starsCount = this.starsCount - Upgrades.getSawsUpgrade(_loc_1).price;
                }
                if (_loc_1 < this.indLightning)
                {
                    this.starsCount = this.starsCount - Upgrades.getLightningUpgrade(_loc_1).price;
                }
                _loc_1++;
            }
            return;
        }// end function

        private function refreshUpgrade(param1:MovieClip, param2:int, param3:int, param4:int) : void
        {
            if (param2 < param3)
            {
                param1.gotoAndStop(1);
            }
            else if (param3 == param2 && param4 <= this.starsCount)
            {
                param1.gotoAndStop(2);
                param1.mcPrice.mouseEnabled = false;
                param1.mcPrice.mouseChildren = false;
                param1.mcPrice.txtPrice.text = param4.toString();
            }
            else
            {
                param1.gotoAndStop(3);
            }
            return;
        }// end function

        private function showUpgradeInfo(event:MouseEvent = null) : void
        {
            var _loc_2:Object = null;
            var _loc_4:Upgrade = null;
            if (this.hint.visible)
            {
                this.curMouseButton = event.currentTarget;
                return;
            }
            if (event)
            {
                _loc_2 = event.currentTarget;
            }
            else
            {
                _loc_2 = this.curMouseButton;
            }
            var _loc_3:* = parseInt(_loc_2.name.substr((_loc_2.name.length - 1)));
            if (_loc_2.name.indexOf("btTower") == 0)
            {
                _loc_4 = Upgrades.getTowerUpgrade((_loc_3 - 1));
            }
            else if (_loc_2.name.indexOf("btMachinegun") == 0)
            {
                _loc_4 = Upgrades.getMachineGunUpgrade((_loc_3 - 1));
            }
            else if (_loc_2.name.indexOf("btHeavygun") == 0)
            {
                _loc_4 = Upgrades.getHeavyGunUpgrade((_loc_3 - 1));
            }
            else if (_loc_2.name.indexOf("btSaw") == 0)
            {
                _loc_4 = Upgrades.getSawsUpgrade((_loc_3 - 1));
            }
            else if (_loc_2.name.indexOf("btLightning") == 0)
            {
                _loc_4 = Upgrades.getLightningUpgrade((_loc_3 - 1));
            }
            this.hint.txtPrice.text = _loc_4.price.toString();
            this.hint.txtName.text = _loc_4.title;
            this.hint.txtDescription.text = _loc_4.shortDesc;
            this.hint.txtFeature.text = _loc_4.description;
            this.hint.alpha = 0;
            this.hint.visible = true;
            TweenNano.to(this.hint, 0.2, {alpha:1});
            this.moveHint(event);
            return;
        }// end function

        private function moveHint(event:MouseEvent) : void
        {
            var _loc_2:Object = null;
            if (event)
            {
                _loc_2 = event.currentTarget;
            }
            else
            {
                _loc_2 = this.curMouseButton;
            }
            if (!this.hint.visible)
            {
                this.showUpgradeInfo(event);
            }
            var _loc_3:* = mouseX + 5;
            var _loc_4:* = mouseY - 115;
            if (_loc_2.name.indexOf("btTower") == 0)
            {
                _loc_3 = mouseX + 10;
                _loc_4 = mouseY + 15;
            }
            this.hint.x = this.hint.x + (_loc_3 - this.hint.x) / 2;
            this.hint.y = this.hint.y + (_loc_4 - this.hint.y) / 2;
            this.hint.x = Math.round(this.hint.x);
            this.hint.y = Math.round(this.hint.y);
            return;
        }// end function

        private function hideHint(event:MouseEvent) : void
        {
            this.hideHintObj = event.currentTarget;
            this.curMouseButton = null;
            this.hideHint2();
            return;
        }// end function

        private function hideHint2() : void
        {
            this.hideHintObj = null;
            this.hint.visible = false;
            if (this.curMouseButton)
            {
                this.showUpgradeInfo(null);
            }
            return;
        }// end function

        private function upgrTowerClick(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.indTower + 1;
                _loc_2.indTower = _loc_3;
                this.refresh();
            }
            return;
        }// end function

        private function upgrMachineGunClick(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.indMachinegun + 1;
                _loc_2.indMachinegun = _loc_3;
                this.refresh();
            }
            return;
        }// end function

        private function upgrHeavyGunClick(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.indHeavygun + 1;
                _loc_2.indHeavygun = _loc_3;
                this.refresh();
            }
            return;
        }// end function

        private function upgrSawsClick(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.indSaw + 1;
                _loc_2.indSaw = _loc_3;
                this.refresh();
            }
            return;
        }// end function

        private function upgrLightningClick(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.indLightning + 1;
                _loc_2.indLightning = _loc_3;
                this.refresh();
            }
            return;
        }// end function

        public function dispose() : void
        {
            removeChild(this.hintMini);
            this.hintMini = null;
            if (parent)
            {
                parent.removeChild(this);
            }
            return;
        }// end function

    }
}
