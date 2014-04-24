package 
{
    import flash.display.*;
    import flash.events.*;

    public class PanelEnc extends MovieClip
    {
        public var black:BlackRect;
        public var btClose:SimpleButton;
        public var btEnemies:MovieClip;
        public var panelCannons:MovieClip;
        public var panelHelp:MovieClip;
        public var panelEnemies:MovieClip;
        public var btHelp:MovieClip;
        public var btCannons:MovieClip;
        private var newCannonsLevels:Array;
        private var initialized:Boolean = false;
        private var selCannonIcon:MovieClip;
        private var curHelpIndex:int = 1;
        private var totalHelps:int;
        private var selEnemieIcon:MovieClip;

        public function PanelEnc()
        {
            this.newCannonsLevels = [1, 2, 5, 8, 10, 11];
            return;
        }// end function

        public function initialize() : void
        {
            if (!this.initialized)
            {
                this.initializeButton(this.btCannons, this.showCannons);
                this.initializeButton(this.btEnemies, this.showEnemies);
                this.initializeButton(this.btHelp, this.showHelp);
            }
            this.showCannons(null);
            this.initCannons();
            this.initEnemies();
            this.initHelp();
            this.initialized = true;
            return;
        }// end function

        private function initCannons() : void
        {
            var _loc_2:Boolean = false;
            this.selCannonIcon = null;
            this.panelCannons.poster.gotoAndStop("none");
            var _loc_1:int = 1;
            while (_loc_1 < 7)
            {
                
                _loc_2 = HintPanels.newCannons[(_loc_1 - 1)] <= (Saves.curSaves.levelIndex + 1);
                this.initCannonBt(this.panelCannons.getChildByName("m" + _loc_1) as MovieClip, _loc_2, "m" + _loc_1);
                this.initCannonBt(this.panelCannons.getChildByName("h" + _loc_1) as MovieClip, _loc_2, "h" + _loc_1);
                this.initCannonBt(this.panelCannons.getChildByName("s" + _loc_1) as MovieClip, _loc_2, "s" + _loc_1);
                this.initCannonBt(this.panelCannons.getChildByName("l" + _loc_1) as MovieClip, _loc_2, "l" + _loc_1);
                _loc_1++;
            }
            this.panelCannons.m1.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            return;
        }// end function

        private function initCannonBt(param1:MovieClip, param2:Boolean, param3:Object) : void
        {
            param1.gotoAndStop(1);
            param1.removeEventListener(MouseEvent.MOUSE_OVER, this.btCannonOver);
            param1.removeEventListener(MouseEvent.MOUSE_OUT, this.btCannonOut);
            param1.removeEventListener(MouseEvent.CLICK, this.btCannonClick);
            if (param2)
            {
                param1.buttonMode = true;
                param1.img.gotoAndStop(param3);
                param1.addEventListener(MouseEvent.MOUSE_OVER, this.btCannonOver, false, 0, true);
                param1.addEventListener(MouseEvent.MOUSE_OUT, this.btCannonOut, false, 0, true);
                param1.addEventListener(MouseEvent.CLICK, this.btCannonClick, false, 0, true);
            }
            else
            {
                param1.img.gotoAndStop("empty");
            }
            return;
        }// end function

        private function btCannonClick(event:MouseEvent) : void
        {
            if (event.currentTarget == this.selCannonIcon)
            {
                return;
            }
            if (this.selCannonIcon)
            {
                this.selCannonIcon.gotoAndStop(1);
            }
            SoundManager.playClick();
            this.selCannonIcon = event.currentTarget as MovieClip;
            this.selCannonIcon.gotoAndStop(3);
            this.panelCannons.poster.gotoAndStop(event.currentTarget.name);
            var _loc_2:* = event.currentTarget.name.substr(0, 1);
            var _loc_3:* = event.currentTarget.name.substr(1, 1);
            var _loc_4:int = 1;
            var _loc_5:int = 0;
            if (_loc_2 == "h")
            {
                _loc_4 = 2;
            }
            else if (_loc_2 == "s")
            {
                _loc_4 = 3;
            }
            else if (_loc_2 == "l")
            {
                _loc_4 = 4;
            }
            if (_loc_3 == "2")
            {
                _loc_5 = 1;
            }
            else if (_loc_3 == "3")
            {
                _loc_5 = 2;
            }
            else if (_loc_3 == "4")
            {
                _loc_5 = 4;
            }
            else if (_loc_3 == "5")
            {
                _loc_5 = 3;
            }
            else if (_loc_3 == "6")
            {
                _loc_5 = 5;
            }
            CannonInfo.writeCannonInfo(_loc_4, _loc_5, this.panelCannons, true);
            return;
        }// end function

        private function btCannonOver(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 1)
            {
                event.currentTarget.gotoAndStop(2);
            }
            return;
        }// end function

        private function btCannonOut(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                event.currentTarget.gotoAndStop(1);
            }
            return;
        }// end function

        private function initHelp() : void
        {
            this.curHelpIndex = 1;
            this.totalHelps = this.panelHelp.image.totalFrames;
            this.panelHelp.descr.btPlay.visible = false;
            if (!this.panelHelp.btPrev.hasEventListener(MouseEvent.CLICK))
            {
                this.panelHelp.btPrev.addEventListener(MouseEvent.CLICK, this.showPrevHelp, false, 0, true);
            }
            if (!this.panelHelp.btNext.hasEventListener(MouseEvent.CLICK))
            {
                this.panelHelp.btNext.addEventListener(MouseEvent.CLICK, this.showNextHelp, false, 0, true);
            }
            this.showHelp2();
            return;
        }// end function

        private function showPrevHelp(event:MouseEvent) : void
        {
            SoundManager.playClick();
            var _loc_2:String = this;
            var _loc_3:* = this.curHelpIndex - 1;
            _loc_2.curHelpIndex = _loc_3;
            this.showHelp2();
            return;
        }// end function

        private function showNextHelp(event:MouseEvent) : void
        {
            SoundManager.playClick();
            var _loc_2:String = this;
            var _loc_3:* = this.curHelpIndex + 1;
            _loc_2.curHelpIndex = _loc_3;
            this.showHelp2();
            return;
        }// end function

        private function showHelp2() : void
        {
            if (this.curHelpIndex < 1)
            {
                this.curHelpIndex = 1;
            }
            if (this.curHelpIndex > this.totalHelps)
            {
                this.curHelpIndex = totalFrames;
            }
            this.panelHelp.txtNum.text = this.curHelpIndex + "/" + this.totalHelps;
            this.panelHelp.btNext.visible = this.curHelpIndex < this.totalHelps;
            this.panelHelp.btPrev.visible = this.curHelpIndex > 1;
            this.panelHelp.image.gotoAndStop(this.curHelpIndex);
            this.panelHelp.image.movie.gotoAndPlay(1);
            this.panelHelp.descr.descr.gotoAndStop(this.curHelpIndex);
            return;
        }// end function

        private function initEnemies() : void
        {
            var _loc_2:int = 0;
            var _loc_3:Boolean = false;
            var _loc_4:Object = null;
            this.selEnemieIcon = null;
            this.panelEnemies.poster.gotoAndStop("none");
            var _loc_1:int = 0;
            _loc_2 = 0;
            while (_loc_2 < Saves.curSaves.enemyIsShow.length)
            {
                
                if (Saves.curSaves.enemyIsShow[_loc_2] == true)
                {
                    _loc_1++;
                    _loc_3 = true;
                    _loc_4 = HintPanels.enemies[_loc_2];
                    this.initEnemieBt(this.panelEnemies.getChildByName("en" + _loc_1) as MovieClip, _loc_3, _loc_4);
                }
                _loc_2++;
            }
            _loc_2 = _loc_1;
            while (_loc_2 < 17)
            {
                
                _loc_1++;
                _loc_3 = false;
                _loc_4 = "lock";
                this.initEnemieBt(this.panelEnemies.getChildByName("en" + _loc_1) as MovieClip, _loc_3, _loc_4);
                _loc_2++;
            }
            this.panelEnemies.en1.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            return;
        }// end function

        private function initEnemieBt(param1:MovieClip, param2:Boolean, param3:Object) : void
        {
            param1.gotoAndStop(1);
            param1.removeEventListener(MouseEvent.MOUSE_OVER, this.btEnemieOver);
            param1.removeEventListener(MouseEvent.MOUSE_OUT, this.btEnemieOut);
            param1.removeEventListener(MouseEvent.CLICK, this.btEnemieClick);
            if (param2)
            {
                param1.buttonMode = true;
                param1.img.gotoAndStop(param3);
                param1.addEventListener(MouseEvent.MOUSE_OVER, this.btEnemieOver, false, 0, true);
                param1.addEventListener(MouseEvent.MOUSE_OUT, this.btEnemieOut, false, 0, true);
                param1.addEventListener(MouseEvent.CLICK, this.btEnemieClick, false, 0, true);
            }
            else
            {
                param1.img.gotoAndStop("lock");
            }
            return;
        }// end function

        private function btEnemieClick(event:MouseEvent) : void
        {
            var _loc_3:Enemy = null;
            if (event.currentTarget == this.selEnemieIcon)
            {
                return;
            }
            if (this.selEnemieIcon)
            {
                this.selEnemieIcon.gotoAndStop(1);
            }
            this.selEnemieIcon = event.currentTarget as MovieClip;
            this.selEnemieIcon.gotoAndStop(3);
            this.panelEnemies.poster.gotoAndStop(event.currentTarget.img.currentFrame);
            var _loc_2:* = event.currentTarget.img.currentLabel;
            if (_loc_2 == "unit1")
            {
                _loc_3 = new Unit1();
            }
            else if (_loc_2 == "parashut")
            {
                _loc_3 = new Parashutist();
            }
            else if (_loc_2 == "unit2")
            {
                _loc_3 = new Unit2();
            }
            else if (_loc_2 == "wheel")
            {
                _loc_3 = new Wheel();
            }
            else if (_loc_2 == "tanket")
            {
                _loc_3 = new Tanket();
            }
            else if (_loc_2 == "car")
            {
                _loc_3 = new Car();
            }
            else if (_loc_2 == "tank1")
            {
                _loc_3 = new Tank1();
            }
            else if (_loc_2 == "tank2")
            {
                _loc_3 = new Tank2();
            }
            else if (_loc_2 == "tank3")
            {
                _loc_3 = new Tank3();
            }
            else if (_loc_2 == "tank4")
            {
                _loc_3 = new Tank4();
            }
            else if (_loc_2 == "walker1")
            {
                _loc_3 = new Walker1();
            }
            else if (_loc_2 == "walker2")
            {
                _loc_3 = new Walker2();
            }
            else if (_loc_2 == "airplane")
            {
                _loc_3 = new Airplane();
            }
            else if (_loc_2 == "heli")
            {
                _loc_3 = new Helicopter();
            }
            else if (_loc_2 == "aerostat")
            {
                _loc_3 = new Aerostat();
            }
            else if (_loc_2 == "balloon")
            {
                _loc_3 = new Balloon();
            }
            else if (_loc_2 == "airship")
            {
                _loc_3 = new Airship();
            }
            SoundManager.playClick();
            UnitInfo.writeUnitInfo(_loc_3, this.panelEnemies, true);
            return;
        }// end function

        private function btEnemieOver(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 1)
            {
                event.currentTarget.gotoAndStop(2);
            }
            return;
        }// end function

        private function btEnemieOut(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                event.currentTarget.gotoAndStop(1);
            }
            return;
        }// end function

        private function initializeButton(param1:MovieClip, param2:Function) : void
        {
            param1.gotoAndStop(1);
            param1.addEventListener(MouseEvent.CLICK, param2, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_OVER, this.btSelPanOver, false, 0, true);
            param1.addEventListener(MouseEvent.MOUSE_OUT, this.btSelPanOut, false, 0, true);
            return;
        }// end function

        private function btSelPanOver(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 1)
            {
                event.currentTarget.gotoAndStop(2);
            }
            return;
        }// end function

        private function btSelPanOut(event:MouseEvent) : void
        {
            if (event.currentTarget.currentFrame == 2)
            {
                event.currentTarget.gotoAndStop(1);
            }
            return;
        }// end function

        private function showCannons(event:MouseEvent) : void
        {
            this.hideAll();
            this.btCannons.gotoAndStop(3);
            this.btCannons.buttonMode = false;
            this.panelCannons.visible = true;
            if (event)
            {
                SoundManager.playClick();
            }
            return;
        }// end function

        private function showEnemies(event:MouseEvent) : void
        {
            this.hideAll();
            this.btEnemies.gotoAndStop(3);
            this.btEnemies.buttonMode = false;
            this.panelEnemies.visible = true;
            SoundManager.playClick();
            return;
        }// end function

        private function showHelp(event:MouseEvent) : void
        {
            this.hideAll();
            this.btHelp.gotoAndStop(3);
            this.btHelp.buttonMode = false;
            this.panelHelp.visible = true;
            SoundManager.playClick();
            return;
        }// end function

        private function hideAll() : void
        {
            this.panelHelp.visible = false;
            this.panelCannons.visible = false;
            this.panelEnemies.visible = false;
            this.btCannons.buttonMode = true;
            this.btEnemies.buttonMode = true;
            this.btHelp.buttonMode = true;
            this.btCannons.gotoAndStop(1);
            this.btEnemies.gotoAndStop(1);
            this.btHelp.gotoAndStop(1);
            return;
        }// end function

        public function dispose() : void
        {
            return;
        }// end function

    }
}
