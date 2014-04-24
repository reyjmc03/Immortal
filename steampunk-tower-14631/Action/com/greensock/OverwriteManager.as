package com.greensock
{
    import com.greensock.core.*;

    public class OverwriteManager extends Object
    {
        public static const version:Number = 6.03;
        public static const NONE:int = 0;
        public static const ALL_IMMEDIATE:int = 1;
        public static const AUTO:int = 2;
        public static const CONCURRENT:int = 3;
        public static const ALL_ONSTART:int = 4;
        public static const PREEXISTING:int = 5;
        public static var mode:int;
        public static var enabled:Boolean;

        public function OverwriteManager()
        {
            return;
        }// end function

        public static function init(param1:int = 2) : int
        {
            if (TweenLite.version < 11.1)
            {
                throw new Error("Warning: Your TweenLite class needs to be updated to work with OverwriteManager (or you may need to clear your ASO files). Please download and install the latest version from http://www.tweenlite.com.");
            }
            TweenLite.overwriteManager = OverwriteManager;
            mode = param1;
            enabled = true;
            return mode;
        }// end function

        public static function manageOverwrites(param1:TweenLite, param2:Object, param3:Array, param4:uint) : Boolean
        {
            var _loc_5:int = 0;
            var _loc_6:Boolean = false;
            var _loc_7:TweenLite = null;
            var _loc_13:uint = 0;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:TweenCore = null;
            var _loc_17:Number = NaN;
            var _loc_18:SimpleTimeline = null;
            if (param4 >= 4)
            {
                _loc_13 = param3.length;
                _loc_5 = 0;
                while (_loc_5 < _loc_13)
                {
                    
                    _loc_7 = param3[_loc_5];
                    if (_loc_7 != param1)
                    {
                        if (_loc_7.setEnabled(false, false))
                        {
                            _loc_6 = true;
                        }
                    }
                    else if (param4 == 5)
                    {
                        break;
                    }
                    _loc_5++;
                }
                return _loc_6;
            }
            var _loc_8:* = param1.cachedStartTime + 1e-010;
            var _loc_9:Array = [];
            var _loc_10:Array = [];
            var _loc_11:uint = 0;
            var _loc_12:uint = 0;
            _loc_5 = param3.length;
            while (--_loc_5 > -1)
            {
                
                _loc_7 = param3[_loc_5];
                if (_loc_7 == param1 || _loc_7.gc)
                {
                    continue;
                }
                if (_loc_7.timeline != param1.timeline)
                {
                    if (!getGlobalPaused(_loc_7))
                    {
                        _loc_10[++_loc_11] = _loc_7;
                    }
                    continue;
                }
                if (_loc_7.cachedStartTime <= _loc_8 && _loc_7.cachedStartTime + _loc_7.totalDuration + 1e-010 > _loc_8 && !getGlobalPaused(_loc_7))
                {
                    _loc_9[++_loc_12] = _loc_7;
                }
            }
            if (_loc_11 != 0)
            {
                _loc_14 = param1.cachedTimeScale;
                _loc_15 = _loc_8;
                _loc_18 = param1.timeline;
                while (_loc_18)
                {
                    
                    _loc_14 = _loc_14 * _loc_18.cachedTimeScale;
                    _loc_15 = _loc_15 + _loc_18.cachedStartTime;
                    _loc_18 = _loc_18.timeline;
                }
                _loc_8 = _loc_14 * _loc_15;
                --_loc_5 = _loc_11;
                while (--_loc_5 > -1)
                {
                    
                    _loc_16 = _loc_10[--_loc_5];
                    _loc_14 = _loc_16.cachedTimeScale;
                    _loc_15 = _loc_16.cachedStartTime;
                    _loc_18 = _loc_16.timeline;
                    while (_loc_18)
                    {
                        
                        _loc_14 = _loc_14 * _loc_18.cachedTimeScale;
                        _loc_15 = _loc_15 + _loc_18.cachedStartTime;
                        _loc_18 = _loc_18.timeline;
                    }
                    _loc_17 = _loc_14 * _loc_15;
                    if (_loc_17 <= _loc_8 && (_loc_17 + _loc_16.totalDuration * _loc_14 + 1e-010 > _loc_8 || _loc_16.cachedDuration == 0))
                    {
                        _loc_9[++_loc_12] = _loc_16;
                    }
                }
            }
            if (_loc_12 == 0)
            {
                return _loc_6;
            }
            --_loc_5 = _loc_12;
            if (param4 == 2)
            {
                while (--_loc_5 > -1)
                {
                    
                    _loc_7 = _loc_9[--_loc_5];
                    if (_loc_7.killVars(param2))
                    {
                        _loc_6 = true;
                    }
                    if (_loc_7.cachedPT1 == null && _loc_7.initted)
                    {
                        _loc_7.setEnabled(false, false);
                    }
                }
            }
            else
            {
                while (--_loc_5 > -1)
                {
                    
                    if (TweenLite(_loc_9[--_loc_5]).setEnabled(false, false))
                    {
                        _loc_6 = true;
                    }
                }
            }
            return _loc_6;
        }// end function

        public static function getGlobalPaused(param1:TweenCore) : Boolean
        {
            var _loc_2:Boolean = false;
            while (param1)
            {
                
                if (param1.cachedPaused)
                {
                    _loc_2 = true;
                    break;
                }
                param1 = param1.timeline;
            }
            return _loc_2;
        }// end function

    }
}
