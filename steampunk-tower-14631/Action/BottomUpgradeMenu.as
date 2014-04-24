package 
{
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;

    public class BottomUpgradeMenu extends MovieClip
    {
        public var btSell:btsell;
        public var btUpgrade1:btupgrade1;
        public var btUpgrade2:btupgrade2;
        private var level:Level;
        public var state:int = 0;
        private var startX:Number = -30;
        private var startY:Number = -20;
        private var animTime:Number = 0.35;
        private var nextInd1:int = 0;
        private var nextInd2:int = 0;
        private var cannon:Cannon;
        private var isShow2Buttons:Boolean = false;

        public function BottomUpgradeMenu()
        {
            addEventListener(Event.ENTER_FRAME, this.update, false, 0, true);
            return;
        }// end function

        public function initialize(param1:Level) : void
        {
            this.level = param1;
            this.btUpgrade1.addEventListener(MouseEvent.CLICK, this.btUpgrade1Click, false, 0, true);
            this.btUpgrade2.addEventListener(MouseEvent.CLICK, this.btUpgrade2Click, false, 0, true);
            this.btSell.addEventListener(MouseEvent.CLICK, this.btSellClick, false, 0, true);
            this.initButton(this.btUpgrade1);
            this.initButton(this.btUpgrade2);
            this.initButton(this.btSell);
            this.btSell.isSell = true;
            this.setState(0);
            return;
        }// end function

        private function initButton(param1:MovieClip) : void
        {
            param1.x = this.startX;
            param1.y = this.startY;
            param1.alpha = 0;
            param1.buttonMode = true;
            param1.mouseChildren = false;
            param1.enabled = true;
            param1.gotoAndStop(1);
            param1.addEventListener(MouseEvent.MOUSE_OVER, this.btMouseOver, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_OUT, this.btMouseOut, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_MOVE, this.btMosueMove, false, 0, true);
            return;
        }// end function

        private function btMosueMove(event:MouseEvent) : void
        {
            if (!this.cannon)
            {
                return;
            }
            var _loc_2:Number = 68;
            if (this.isShow2Buttons)
            {
                _loc_2 = 35;
            }
            if (event.target == this.btUpgrade1)
            {
                if (this.btUpgrade1.currentFrame != 4)
                {
                    this.level.showCannonInfoBig(this.cannon.type, this.nextInd1, this.btUpgrade1, 105, _loc_2);
                }
            }
            else if (event.target == this.btUpgrade2)
            {
                if (this.btUpgrade2.currentFrame != 4)
                {
                    this.level.showCannonInfoBig(this.cannon.type, this.nextInd2, this.btUpgrade2, 105, _loc_2);
                }
            }
            return;
        }// end function

        private function btMouseOver(event:MouseEvent) : void
        {
            var _loc_2:* = event.target as MovieClip;
            if (_loc_2.enabled)
            {
                _loc_2.gotoAndStop(2);
                _loc_2.update();
            }
            return;
        }// end function

        private function btMouseOut(event:MouseEvent) : void
        {
            var _loc_2:* = event.target as MovieClip;
            if (_loc_2.enabled)
            {
                _loc_2.gotoAndStop(1);
                _loc_2.update();
            }
            this.level.hideCannonInfoBig(_loc_2);
            return;
        }// end function

        public function show(param1:Cannon) : void
        {
            if (this.level.helps.currentHint == 6)
            {
                this.level.helps.hideHint();
            }
            var _loc_2:* = param1.upgradeInd;
            this.setState(1);
            this.cannon = param1;
            TweenLite.killTweensOf(this.btSell);
            TweenLite.killTweensOf(this.btUpgrade1);
            TweenLite.killTweensOf(this.btUpgrade2);
            this.btSell.visible = true;
            this.btSell.price = param1.totalMoney * 0.5;
            TweenLite.to(this.btSell, this.animTime, {y:-20, x:-210, alpha:1, onComplete:this.setState, onCompleteParams:[2]});
            if (_loc_2 == 3 || _loc_2 == 5)
            {
                return;
            }
            this.isShow2Buttons = false;
            if (_loc_2 == 0)
            {
                this.showUpgrade1Button(1);
                this.btUpgrade1.upgrIndex = "2-0";
            }
            else if (_loc_2 == 1)
            {
                this.isShow2Buttons = true;
                this.showUpgrade1Button(2);
                this.showUpgrade2Button(4);
                this.btUpgrade1.upgrIndex = "3-1";
                this.btUpgrade2.upgrIndex = "3-2";
            }
            else if (_loc_2 == 2)
            {
                this.showUpgrade1Button(3);
                this.btUpgrade1.upgrIndex = "4-1";
            }
            else if (_loc_2 == 4)
            {
                this.showUpgrade2Button(5);
                this.btUpgrade2.upgrIndex = "4-2";
            }
            return;
        }// end function

        private function showUpgrade1Button(param1:int) : void
        {
            this.setState(1);
            this.btUpgrade1.visible = true;
            this.nextInd1 = param1;
            this.btUpgrade1.price = this.cannon.getUpgradePrice(param1);
            if (this.isShow2Buttons)
            {
                TweenLite.to(this.btUpgrade1, this.animTime, {y:-60, x:100, alpha:1});
            }
            else
            {
                TweenLite.to(this.btUpgrade1, this.animTime, {y:-20, x:100, alpha:1});
            }
            return;
        }// end function

        private function showUpgrade2Button(param1:int) : void
        {
            this.setState(1);
            this.btUpgrade2.visible = true;
            this.nextInd2 = param1;
            this.btUpgrade2.price = this.cannon.getUpgradePrice(param1);
            if (this.isShow2Buttons)
            {
                TweenLite.to(this.btUpgrade2, this.animTime, {y:-5, x:100, alpha:1});
            }
            else
            {
                TweenLite.to(this.btUpgrade2, this.animTime, {y:-20, x:100, alpha:1});
            }
            return;
        }// end function

        private function btUpgrade1Click(event:MouseEvent) : void
        {
            if (this.btUpgrade1.enabled)
            {
                this.upgrade(this.nextInd1, this.btUpgrade1.price);
            }
            return;
        }// end function

        private function btUpgrade2Click(event:MouseEvent) : void
        {
            if (this.btUpgrade2.enabled)
            {
                this.upgrade(this.nextInd2, this.btUpgrade2.price);
            }
            return;
        }// end function

        private function upgrade(param1:int, param2:int) : void
        {
            this.hideAll();
            this.level.money = this.level.money - param2;
            this.cannon.totalMoney = this.cannon.totalMoney + param2;
            this.level.tower.upgradeCannon(this.cannon, param1);
            return;
        }// end function

        private function btSellClick(event:MouseEvent) : void
        {
            this.level.money = this.level.money + this.btSell.price;
            this.level.tower.removeCannon(this.cannon);
            this.level.tower.onCannolLeavePodval();
            return;
        }// end function

        public function hideAll() : void
        {
            TweenLite.killTweensOf(this.btSell);
            TweenLite.killTweensOf(this.btUpgrade1);
            TweenLite.killTweensOf(this.btUpgrade2);
            this.setState(1);
            TweenLite.to(this.btSell, this.animTime, {y:this.startY, x:this.startX, alpha:0});
            TweenLite.to(this.btUpgrade1, this.animTime, {y:this.startY, x:this.startX, alpha:0});
            TweenLite.to(this.btUpgrade2, this.animTime, {y:this.startY, x:this.startX, alpha:0, onComplete:this.setState, onCompleteParams:[0]});
            return;
        }// end function

        private function setState(param1:int) : void
        {
            mouseEnabled = param1 == 2;
            mouseChildren = param1 == 2;
            if (param1 == 0)
            {
                this.btUpgrade1.visible = false;
                this.btUpgrade2.visible = false;
                this.btSell.visible = false;
            }
            this.state = param1;
            return;
        }// end function

        public function update(event:Event) : void
        {
            if (this.state != 0)
            {
                this.checkButton(this.btUpgrade1);
                this.checkButton(this.btUpgrade2);
            }
            return;
        }// end function

        private function checkButton(param1:BuyButton) : void
        {
            var _loc_2:int = 0;
            if (this.cannon)
            {
                _loc_2 = this.cannon.upgradeInd;
                if (_loc_2 >= this.level.levelManager.maxUpgradeIndex || param1 == this.btUpgrade2 && !this.level.levelManager.upgradeTwo && !(_loc_2 == 1 && this.level.levelManager.maxUpgradeIndex == 5))
                {
                    param1.enabled = false;
                    param1.gotoAndStop(4);
                    return;
                }
                if (this.level.money < param1.price || this.cannon && !this.cannon.canUpgrade())
                {
                    param1.enabled = false;
                    param1.gotoAndStop(3);
                }
                else if (!param1.enabled)
                {
                    param1.enabled = true;
                    param1.gotoAndStop(1);
                }
            }
            return;
        }// end function

        private function disposeButton(param1:MovieClip) : void
        {
            param1.removeEventListener(MouseEvent.MOUSE_OVER, this.btMouseOver);
            param1.removeEventListener(MouseEvent.MOUSE_OUT, this.btMouseOut);
            param1.removeEventListener(MouseEvent.MOUSE_MOVE, this.btMosueMove);
            return;
        }// end function

        public function dispose() : void
        {
            this.level = null;
            this.btUpgrade1.removeEventListener(MouseEvent.CLICK, this.btUpgrade1Click);
            this.btUpgrade2.removeEventListener(MouseEvent.CLICK, this.btUpgrade2Click);
            this.btSell.removeEventListener(MouseEvent.CLICK, this.btSellClick);
            removeEventListener(Event.ENTER_FRAME, this.update);
            this.disposeButton(this.btUpgrade1);
            this.disposeButton(this.btUpgrade2);
            this.disposeButton(this.btSell);
            if (parent)
            {
                parent.removeChild(this);
            }
            return;
        }// end function

    }
}
