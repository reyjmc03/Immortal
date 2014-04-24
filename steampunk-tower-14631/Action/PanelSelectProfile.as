package 
{
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;

    public class PanelSelectProfile extends MovieClip
    {
        public var black:BlackRect;
        public var btClear2:SimpleButton;
        public var btClear3:SimpleButton;
        public var btClear1:SimpleButton;
        public var btSlot1:MovieClip;
        public var btSlot2:MovieClip;
        public var btSlot3:MovieClip;

        public function PanelSelectProfile()
        {
            return;
        }// end function

        public function show() : void
        {
            this.initialize();
            parent.setChildIndex(this, (parent.numChildren - 1));
            visible = true;
            alpha = 0;
            x = 0;
            y = -20;
            TweenLite.to(this, 0.5, {alpha:1, x:0, y:0});
            return;
        }// end function

        public function initialize() : void
        {
            this.initBt(this.btSlot1, Saves.profile1);
            this.initBt(this.btSlot2, Saves.profile2);
            this.initBt(this.btSlot3, Saves.profile3);
            if (!this.btClear1.hasEventListener(MouseEvent.CLICK))
            {
                this.btClear1.addEventListener(MouseEvent.CLICK, this.btClearClick, false, 0, true);
            }
            if (!this.btClear2.hasEventListener(MouseEvent.CLICK))
            {
                this.btClear2.addEventListener(MouseEvent.CLICK, this.btClearClick, false, 0, true);
            }
            if (!this.btClear3.hasEventListener(MouseEvent.CLICK))
            {
                this.btClear3.addEventListener(MouseEvent.CLICK, this.btClearClick, false, 0, true);
            }
            return;
        }// end function

        private function btClearClick(event:MouseEvent) : void
        {
            if (event.currentTarget == this.btClear1)
            {
                Saves.profile1.clear();
            }
            else if (event.currentTarget == this.btClear2)
            {
                Saves.profile2.clear();
            }
            else if (event.currentTarget == this.btClear3)
            {
                Saves.profile3.clear();
            }
            Saves.save(false);
            this.initialize();
            SoundManager.playClick();
            return;
        }// end function

        private function initBt(param1:MovieClip, param2:SavesProfile) : void
        {
            if (param2.active)
            {
                param1.gotoAndStop(1);
            }
            else
            {
                param1.gotoAndStop(3);
            }
            param1.buttonMode = true;
            param1.mouseChildren = false;
            if (!param1.hasEventListener(MouseEvent.MOUSE_OVER))
            {
                param1.addEventListener(MouseEvent.MOUSE_OVER, this.btMouseOver, false, 0, true);
            }
            if (!param1.hasEventListener(MouseEvent.MOUSE_OUT))
            {
                param1.addEventListener(MouseEvent.MOUSE_OUT, this.btMouseOut, false, 0, true);
            }
            if (!param1.hasEventListener(MouseEvent.CLICK))
            {
                param1.addEventListener(MouseEvent.CLICK, this.btMouseClick, false, 0, true);
            }
            param1.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OUT));
            return;
        }// end function

        private function btMouseClick(event:MouseEvent) : void
        {
            this.btSlot1.gotoAndStop(3);
            this.btSlot2.gotoAndStop(3);
            this.btSlot3.gotoAndStop(3);
            this.btSlot1.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OUT));
            this.btSlot2.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OUT));
            this.btSlot3.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OUT));
            var _loc_2:* = event.currentTarget as MovieClip;
            _loc_2.gotoAndStop(1);
            _loc_2.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
            if (_loc_2.name == "btSlot1" && !Saves.profile1.active)
            {
                this.selectProfile(1);
            }
            else if (_loc_2.name == "btSlot2" && !Saves.profile2.active)
            {
                this.selectProfile(2);
            }
            else if (_loc_2.name == "btSlot3" && !Saves.profile3.active)
            {
                this.selectProfile(3);
            }
            else
            {
                this.hide();
            }
            return;
        }// end function

        private function selectProfile(param1:int) : void
        {
            Saves.profile1.active = param1 == 1;
            Saves.profile2.active = param1 == 2;
            Saves.profile3.active = param1 == 3;
            Saves.save();
            MovieClip(parent).mcMain.txtCurProfile.text = param1.toString();
            this.hide();
            return;
        }// end function

        private function hide() : void
        {
            SoundManager.playClick();
            TweenLite.to(this, 0.5, {alpha:0, x:0, y:-20, onComplete:this.hide2});
            return;
        }// end function

        private function hide2() : void
        {
            visible = false;
            MovieClip(parent).state = 0;
            MovieClip(parent).initializeSelectLevel();
            this.dispose();
            return;
        }// end function

        private function btMouseOver(event:MouseEvent) : void
        {
            var _loc_2:* = event.currentTarget as MovieClip;
            if (_loc_2.currentFrame == 3)
            {
                _loc_2.gotoAndStop(4);
            }
            if (_loc_2.currentFrame == 1)
            {
                _loc_2.gotoAndStop(2);
            }
            this.updateBtText(_loc_2);
            return;
        }// end function

        private function btMouseOut(event:MouseEvent) : void
        {
            var _loc_2:* = event.currentTarget as MovieClip;
            if (_loc_2.currentFrame == 4)
            {
                _loc_2.gotoAndStop(3);
            }
            if (_loc_2.currentFrame == 2)
            {
                _loc_2.gotoAndStop(1);
            }
            this.updateBtText(_loc_2);
            return;
        }// end function

        private function updateBtText(param1:MovieClip) : void
        {
            param1.txtSlot.text = "Slot 1";
            var _loc_2:* = Saves.profile1;
            if (param1 == this.btSlot2)
            {
                param1.txtSlot.text = "Slot 2";
                _loc_2 = Saves.profile2;
            }
            else if (param1 == this.btSlot3)
            {
                param1.txtSlot.text = "Slot 3";
                _loc_2 = Saves.profile3;
            }
            param1.txtLevel.text = "LEVEL " + ((_loc_2.levelIndex + 1)).toString();
            param1.txtStars.text = _loc_2.totalStars + "/60";
            return;
        }// end function

        public function dispose() : void
        {
            this.dispBt(this.btSlot1);
            this.dispBt(this.btSlot2);
            this.dispBt(this.btSlot3);
            this.btClear1.removeEventListener(MouseEvent.CLICK, this.btClearClick);
            this.btClear2.removeEventListener(MouseEvent.CLICK, this.btClearClick);
            this.btClear3.removeEventListener(MouseEvent.CLICK, this.btClearClick);
            parent.removeChild(this);
            return;
        }// end function

        public function dispBt(param1:MovieClip) : void
        {
            param1.removeEventListener(MouseEvent.MOUSE_OVER, this.btMouseOver);
            param1.removeEventListener(MouseEvent.MOUSE_OUT, this.btMouseOut);
            param1.removeEventListener(MouseEvent.CLICK, this.btMouseClick);
            return;
        }// end function

    }
}
