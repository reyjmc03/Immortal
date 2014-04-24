﻿package com.greensock
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class TweenNano extends Object
    {
        public var duration:Number;
        public var vars:Object;
        public var startTime:Number;
        public var target:Object;
        public var active:Boolean;
        public var gc:Boolean;
        public var useFrames:Boolean;
        public var ratio:Number = 0;
        protected var _ease:Function;
        protected var _initted:Boolean;
        protected var _propTweens:Array;
        static var _time:Number;
        static var _frame:uint;
        static var _masterList:Dictionary = new Dictionary(false);
        static var _shape:Shape = new Shape();
        static var _tnInitted:Boolean;
        static var _reservedProps:Object = {ease:1, delay:1, useFrames:1, overwrite:1, onComplete:1, onCompleteParams:1, runBackwards:1, immediateRender:1, onUpdate:1, onUpdateParams:1};

        public function TweenNano(param1:Object, param2:Number, param3:Object)
        {
            if (!_tnInitted)
            {
                _time = getTimer() * 0.001;
                _frame = 0;
                _shape.addEventListener(Event.ENTER_FRAME, updateAll, false, 0, true);
                _tnInitted = true;
            }
            this.vars = param3;
            this.duration = param2;
            this.active = Boolean(param2 == 0 && this.vars.delay == 0 && this.vars.immediateRender != false);
            this.target = param1;
            if (typeof(this.vars.ease) != "function")
            {
                this._ease = TweenNano.easeOut;
            }
            else
            {
                this._ease = this.vars.ease;
            }
            this._propTweens = [];
            this.useFrames = Boolean(param3.useFrames == true);
            var _loc_4:* = "delay" in this.vars ? (Number(this.vars.delay)) : (0);
            this.startTime = this.useFrames ? (_frame + _loc_4) : (_time + _loc_4);
            var _loc_5:* = _masterList[param1];
            if (_masterList[param1] == null || int(this.vars.overwrite) == 1 || this.vars.overwrite == null)
            {
                _masterList[param1] = [this];
            }
            else
            {
                _loc_5[_loc_5.length] = this;
            }
            if (this.vars.immediateRender == true || this.active)
            {
                this.renderTime(0);
            }
            return;
        }// end function

        public function init() : void
        {
            var _loc_1:String = null;
            var _loc_2:Array = null;
            var _loc_3:int = 0;
            for (_loc_1 in this.vars)
            {
                
                if (!(_loc_1 in _reservedProps))
                {
                    this._propTweens[this._propTweens.length] = [_loc_1, this.target[_loc_1], typeof(this.vars[_loc_1]) == "number" ? (this.vars[_loc_1] - this.target[_loc_1]) : (Number(this.vars[_loc_1]))];
                }
            }
            if (this.vars.runBackwards)
            {
                _loc_3 = this._propTweens.length;
                while (--_loc_3 > -1)
                {
                    
                    _loc_2 = this._propTweens[_loc_3];
                    _loc_2[1] = _loc_2[1] + _loc_2[2];
                    _loc_2[2] = -_loc_2[2];
                }
            }
            this._initted = true;
            return;
        }// end function

        public function renderTime(param1:Number) : void
        {
            var _loc_2:Array = null;
            if (!this._initted)
            {
                this.init();
            }
            var _loc_3:* = this._propTweens.length;
            if (param1 >= this.duration)
            {
                param1 = this.duration;
                this.ratio = 1;
            }
            else if (param1 <= 0)
            {
                this.ratio = 0;
            }
            else
            {
                this.ratio = this._ease(param1, 0, 1, this.duration);
            }
            while (--_loc_3 > -1)
            {
                
                _loc_2 = this._propTweens[_loc_3];
                this.target[_loc_2[0]] = _loc_2[1] + this.ratio * _loc_2[2];
            }
            if (this.vars.onUpdate)
            {
                this.vars.onUpdate.apply(null, this.vars.onUpdateParams);
            }
            if (param1 == this.duration)
            {
                this.complete(true);
            }
            return;
        }// end function

        public function complete(param1:Boolean = false) : void
        {
            if (!param1)
            {
                this.renderTime(this.duration);
                return;
            }
            this.kill();
            if (this.vars.onComplete)
            {
                this.vars.onComplete.apply(null, this.vars.onCompleteParams);
            }
            return;
        }// end function

        public function kill() : void
        {
            this.gc = true;
            this.active = false;
            return;
        }// end function

        public static function to(param1:Object, param2:Number, param3:Object) : TweenNano
        {
            return new TweenNano(param1, param2, param3);
        }// end function

        public static function from(param1:Object, param2:Number, param3:Object) : TweenNano
        {
            param3.runBackwards = true;
            if (!("immediateRender" in param3))
            {
                param3.immediateRender = true;
            }
            return new TweenNano(param1, param2, param3);
        }// end function

        public static function delayedCall(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : TweenNano
        {
            return new TweenNano(param2, 0, {delay:param1, onComplete:param2, onCompleteParams:param3, useFrames:param4, overwrite:0});
        }// end function

        public static function updateAll(event:Event = null) : void
        {
            var _loc_3:Array = null;
            var _loc_4:Object = null;
            var _loc_5:int = 0;
            var _loc_6:Number = NaN;
            var _loc_7:TweenNano = null;
            var _loc_9:* = _frame + 1;
            _frame = _loc_9;
            _time = getTimer() * 0.001;
            var _loc_2:* = _masterList;
            for (_loc_4 in _loc_2)
            {
                
                _loc_3 = _loc_2[_loc_4];
                _loc_5 = _loc_3.length;
                while (--_loc_5 > -1)
                {
                    
                    _loc_7 = _loc_3[_loc_5];
                    _loc_6 = _loc_7.useFrames ? (_frame) : (_time);
                    if (_loc_7.active || !_loc_7.gc && _loc_6 >= _loc_7.startTime)
                    {
                        _loc_7.renderTime(_loc_6 - _loc_7.startTime);
                        continue;
                    }
                    if (_loc_7.gc)
                    {
                        _loc_3.splice(_loc_5, 1);
                    }
                }
                if (_loc_3.length == 0)
                {
                    delete _loc_2[_loc_4];
                }
            }
            return;
        }// end function

        public static function killTweensOf(param1:Object, param2:Boolean = false) : void
        {
            var _loc_3:Array = null;
            var _loc_4:int = 0;
            if (param1 in _masterList)
            {
                if (param2)
                {
                    _loc_3 = _masterList[param1];
                    _loc_4 = _loc_3.length;
                    while (--_loc_4 > -1)
                    {
                        
                        if (!TweenNano.TweenNano(_loc_3[_loc_4]).gc)
                        {
                            TweenNano.TweenNano(_loc_3[_loc_4]).complete(false);
                        }
                    }
                }
                delete _masterList[param1];
            }
            return;
        }// end function

        private static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            var _loc_5:* = param1 / param4;
            param1 = param1 / param4;
            return -1 * _loc_5 * (param1 - 2);
        }// end function

    }
}
