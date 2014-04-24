package com.greensock.plugins
{
    import com.greensock.*;
    import com.greensock.core.*;
    import flash.display.*;
    import flash.geom.*;

    public class TintPlugin extends TweenPlugin
    {
        protected var _transform:Transform;
        protected var _ct:ColorTransform;
        protected var _ignoreAlpha:Boolean;
        public static const API:Number = 1;
        static var _props:Array = ["redMultiplier", "greenMultiplier", "blueMultiplier", "alphaMultiplier", "redOffset", "greenOffset", "blueOffset", "alphaOffset"];

        public function TintPlugin()
        {
            this.propName = "tint";
            this.overwriteProps = ["tint"];
            return;
        }// end function

        override public function onInitTween(param1:Object, param2, param3:TweenLite) : Boolean
        {
            if (!(param1 is DisplayObject))
            {
                return false;
            }
            var _loc_4:* = new ColorTransform();
            if (param2 != null && param3.vars.removeTint != true)
            {
                _loc_4.color = uint(param2);
            }
            this._ignoreAlpha = true;
            this.init(param1 as DisplayObject, _loc_4);
            return true;
        }// end function

        public function init(param1:DisplayObject, param2:ColorTransform) : void
        {
            var _loc_4:String = null;
            this._transform = param1.transform;
            this._ct = this._transform.colorTransform;
            var _loc_3:* = _props.length;
            while (_loc_3--)
            {
                
                _loc_4 = _props[_loc_3];
                if (this._ct[_loc_4] != param2[_loc_4])
                {
                    _tweens[_tweens.length] = new PropTween(this._ct, _loc_4, this._ct[_loc_4], param2[_loc_4] - this._ct[_loc_4], "tint", false);
                }
            }
            return;
        }// end function

        override public function set changeFactor(param1:Number) : void
        {
            var _loc_2:ColorTransform = null;
            updateTweens(param1);
            if (this._ignoreAlpha)
            {
                _loc_2 = this._transform.colorTransform;
                this._ct.alphaMultiplier = _loc_2.alphaMultiplier;
                this._ct.alphaOffset = _loc_2.alphaOffset;
            }
            this._transform.colorTransform = this._ct;
            return;
        }// end function

    }
}
