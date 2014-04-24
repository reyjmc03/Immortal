package 
{
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;

    public class BottomMenu extends MovieClip
    {
        public var btHeavyGun:btbuyheavygun;
        public var btMachineGun:btbuymachimegun;
        public var btLightning:btbuylightning;
        public var btSaws:btbuysaws;
        private var level:Level;
        private var state:int = 0;
        private var startX:Number = -30;
        private var startY:Number = -20;
        private var animTime:Number = 0.35;

        public function BottomMenu()
        {
            addEventListener(Event.ENTER_FRAME, this.update, false, 0, true);
            return;
        }// end function

        public function isVisible() : Boolean
        {
            return this.state != 0;
        }// end function

        public function initialize(param1:Level) : void
        {
            this.level = param1;
            this.btMachineGun.addEventListener(MouseEvent.CLICK, this.btMachineGunClick, false, 0, true);
            this.btHeavyGun.addEventListener(MouseEvent.CLICK, this.btHeavyGunClick, false, 0, true);
            this.btSaws.addEventListener(MouseEvent.CLICK, this.btSawsClick, false, 0, true);
            this.btLightning.addEventListener(MouseEvent.CLICK, this.btLightningClick, false, 0, true);
            this.initButton(this.btMachineGun);
            this.initButton(this.btHeavyGun);
            this.initButton(this.btSaws);
            this.initButton(this.btLightning);
            stage.addEventListener(MouseEvent.CLICK, this.stageClick, false, 0, true);
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
            param1.addEventListener(MouseEvent.MOUSE_MOVE, this.btMouseMove, false, 0, true);
            return;
        }// end function

        private function btMouseMove(event:MouseEvent) : void
        {
            var _loc_2:* = event.currentTarget as MovieClip;
            if (_loc_2 == this.btMachineGun)
            {
                if (this.btMachineGun.currentFrame != 4)
                {
                    this.level.showCannonInfoBig(1, 0, this.btMachineGun, -375, 68);
                }
            }
            else if (_loc_2 == this.btHeavyGun)
            {
                if (this.btHeavyGun.currentFrame != 4)
                {
                    this.level.showCannonInfoBig(2, 0, this.btHeavyGun, 105, 68);
                }
            }
            else if (_loc_2 == this.btSaws)
            {
                if (this.btSaws.currentFrame != 4)
                {
                    this.level.showCannonInfoBig(3, 0, this.btSaws, 105, 68);
                }
            }
            else if (_loc_2 == this.btLightning)
            {
                if (this.btLightning.currentFrame != 4)
                {
                    this.level.showCannonInfoBig(4, 0, this.btLightning, -375, 68);
                }
            }
            return;
        }// end function

        private function btMouseOver(event:MouseEvent) : void
        {
            var _loc_2:* = event.currentTarget as MovieClip;
            if (_loc_2.enabled)
            {
                _loc_2.gotoAndStop(2);
                _loc_2.update();
            }
            this.btMouseMove(event);
            return;
        }// end function

        private function btMouseOut(event:MouseEvent) : void
        {
            var _loc_2:* = event.currentTarget as MovieClip;
            if (_loc_2.enabled)
            {
                _loc_2.gotoAndStop(1);
                _loc_2.update();
            }
            this.level.hideCannonInfoBig(_loc_2);
            return;
        }// end function

        private function stageClick(event:MouseEvent) : void
        {
            var _loc_2:MovieClip = null;
            if (this.state == 2 && this.level.state == GameState.GAME)
            {
                _loc_2 = event.target as MovieClip;
                if (_loc_2 && _loc_2.parent == this)
                {
                }
                else
                {
                    this.hideAll();
                }
            }
            return;
        }// end function

        private function btMachineGunClick(event:MouseEvent) : void
        {
            var _loc_2:Cannon = null;
            if (this.level.money >= CannonMachineGun.price && this.btMachineGun.enabled)
            {
                this.hideAll();
                _loc_2 = new CannonMachineGun();
                this.level.tower.addCannon(0, 1, _loc_2);
                this.level.money = this.level.money - CannonMachineGun.price;
            }
            return;
        }// end function

        private function btHeavyGunClick(event:MouseEvent) : void
        {
            var _loc_2:Cannon = null;
            if (this.level.money >= CannonHeavyGun.price && this.btHeavyGun.enabled)
            {
                this.hideAll();
                _loc_2 = new CannonHeavyGun();
                this.level.tower.addCannon(0, 1, _loc_2);
                this.level.money = this.level.money - CannonHeavyGun.price;
            }
            return;
        }// end function

        private function btSawsClick(event:MouseEvent) : void
        {
            var _loc_2:Cannon = null;
            if (this.level.money >= CannonSawGun.price && this.btSaws.enabled)
            {
                this.hideAll();
                _loc_2 = new CannonSawGun();
                this.level.tower.addCannon(0, 1, _loc_2);
                this.level.money = this.level.money - CannonSawGun.price;
            }
            return;
        }// end function

        private function btLightningClick(event:MouseEvent) : void
        {
            var _loc_2:Cannon = null;
            if (this.level.money >= CannonElectroGun.price && this.btLightning.enabled)
            {
                this.hideAll();
                _loc_2 = new CannonElectroGun();
                this.level.tower.addCannon(0, 1, _loc_2);
                this.level.money = this.level.money - CannonElectroGun.price;
            }
            return;
        }// end function

        public function showBuyButtons() : void
        {
            if (this.state == 0)
            {
                this.setState(1);
                TweenLite.to(this.btMachineGun, this.animTime, {y:-30, x:-190, alpha:1});
                TweenLite.to(this.btHeavyGun, this.animTime, {y:-30, x:75, alpha:1});
                TweenLite.to(this.btSaws, this.animTime, {y:-16, x:205, alpha:1});
                TweenLite.to(this.btLightning, this.animTime, {y:-16, x:-320, alpha:1, onComplete:this.setState, onCompleteParams:[2]});
                this.btMachineGun.price = CannonMachineGun.price;
                this.btHeavyGun.price = CannonHeavyGun.price;
                this.btSaws.price = CannonSawGun.price;
                this.btLightning.price = CannonElectroGun.price;
                this.btMachineGun.visible = true;
                this.btHeavyGun.visible = true;
                this.btSaws.visible = true;
                this.btLightning.visible = true;
                HintPanels.buyMenuShow = true;
                if (this.level.helps.currentHint == 6)
                {
                    this.level.helps.hideHint();
                }
            }
            return;
        }// end function

        public function hideAll() : void
        {
            if (this.state == 2)
            {
                this.setState(1);
                TweenLite.to(this.btMachineGun, this.animTime, {y:this.startY, x:this.startX, alpha:0});
                TweenLite.to(this.btHeavyGun, this.animTime, {y:this.startY, x:this.startX, alpha:0});
                TweenLite.to(this.btSaws, this.animTime, {y:this.startY, x:this.startX, alpha:0});
                TweenLite.to(this.btLightning, this.animTime, {y:this.startY, x:this.startX, alpha:0, onComplete:this.setState, onCompleteParams:[0]});
                HintPanels.buyMenuShow = false;
            }
            return;
        }// end function

        private function setState(param1:int) : void
        {
            mouseEnabled = param1 == 2;
            mouseChildren = param1 == 2;
            if (param1 == 0)
            {
                this.btMachineGun.visible = false;
                this.btHeavyGun.visible = false;
                this.btSaws.visible = false;
                this.btLightning.visible = false;
            }
            this.state = param1;
            return;
        }// end function

        public function update(event:Event) : void
        {
            if (this.state != 0)
            {
                this.checkButton(this.btMachineGun);
                this.checkButton(this.btHeavyGun);
                this.checkButton(this.btSaws);
                this.checkButton(this.btLightning);
                if (this.level.levelManager.isChallenge)
                {
                    if (!LevelChallengeSettings.machinegun)
                    {
                        this.btMachineGun.enabled = false;
                        this.btMachineGun.gotoAndStop(4);
                    }
                    if (!LevelChallengeSettings.heavygun)
                    {
                        this.btHeavyGun.enabled = false;
                        this.btHeavyGun.gotoAndStop(4);
                    }
                    if (!LevelChallengeSettings.saws)
                    {
                        this.btSaws.enabled = false;
                        this.btSaws.gotoAndStop(4);
                    }
                    if (!LevelChallengeSettings.lightning)
                    {
                        this.btLightning.enabled = false;
                        this.btLightning.gotoAndStop(4);
                    }
                }
            }
            return;
        }// end function

        private function checkButton(param1:BuyButton) : void
        {
            if (this.level.money < param1.price)
            {
                param1.enabled = false;
                param1.gotoAndStop(3);
            }
            else if (!param1.enabled)
            {
                param1.enabled = true;
                param1.gotoAndStop(1);
            }
            return;
        }// end function

        private function disposeButton(param1:MovieClip) : void
        {
            param1.removeEventListener(MouseEvent.MOUSE_OVER, this.btMouseOver);
            param1.removeEventListener(MouseEvent.MOUSE_OUT, this.btMouseOut);
            param1.removeEventListener(MouseEvent.MOUSE_MOVE, this.btMouseMove);
            return;
        }// end function

        public function dispose() : void
        {
            this.level = null;
            this.btMachineGun.removeEventListener(MouseEvent.CLICK, this.btMachineGunClick);
            this.btHeavyGun.removeEventListener(MouseEvent.CLICK, this.btHeavyGunClick);
            this.btSaws.removeEventListener(MouseEvent.CLICK, this.btSawsClick);
            this.btLightning.removeEventListener(MouseEvent.CLICK, this.btLightningClick);
            removeEventListener(Event.ENTER_FRAME, this.update);
            this.disposeButton(this.btMachineGun);
            this.disposeButton(this.btHeavyGun);
            this.disposeButton(this.btSaws);
            this.disposeButton(this.btLightning);
            stage.removeEventListener(MouseEvent.CLICK, this.stageClick);
            if (parent)
            {
                parent.removeChild(this);
            }
            return;
        }// end function

    }
}
