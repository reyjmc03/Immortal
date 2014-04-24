package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class BuyButton extends MovieClip
    {
        public var mcUpgr:MovieClip;
        public var txtPrice:TextField;
        private var _price:int = 100;
        private var lastFrame:int = 0;
        public var isSell:Boolean = false;
        public var upgrIndex:String = "2-0";

        public function BuyButton()
        {
            addEventListener(Event.ENTER_FRAME, this.update);
            return;
        }// end function

        public function set price(param1:int) : void
        {
            this._price = param1;
            this.lastFrame = 0;
            this.update();
            return;
        }// end function

        public function get price() : int
        {
            return this._price;
        }// end function

        public function update(event:Event = null) : void
        {
            if (this.lastFrame != currentFrame && getChildByName("txtPrice"))
            {
                this.lastFrame = currentFrame;
                this.txtPrice.autoSize = TextFieldAutoSize.CENTER;
                this.txtPrice.text = "$" + this.price.toFixed();
                if (this.isSell)
                {
                    this.txtPrice.text = "+ " + this.txtPrice.text;
                }
            }
            if (getChildByName("mcUpgr") != null)
            {
                this.mcUpgr.gotoAndStop(this.upgrIndex);
            }
            return;
        }// end function

    }
}
