package 
{
    import __AS3__.vec.*;
    import com.greensock.*;
    import com.greensock.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class Wave extends Object
    {
        private var time:Number = 0;
        private var lifeTime:Number = 0;
        private var waveGroup:WaveGroup;
        private var enemies:Vector.<Object>;
        private var createdEnemies:Vector.<Enemy>;
        private var createdEnemiesIndex:Vector.<int>;
        private var isCreated:Boolean = false;
        private var createTime:int = 0;
        public var endTime:int = 0;
        private var side:String = "left";
        private var imgInd:int = 1;
        private var waveInfo:MovieClip;
        private var infoImg:MovieClip;
        private var infoImgCreateTime:int = 0;
        private var isInfoImgCreated:Boolean = false;
        private var preStartMoney:int = 0;

        public function Wave(param1:WaveGroup) : void
        {
            this.enemies = new Vector.<Object>;
            this.createdEnemies = new Vector.<Enemy>;
            this.createdEnemiesIndex = new Vector.<int>;
            this.waveGroup = param1;
            return;
        }// end function

        public function dispose() : void
        {
            this.waveGroup = null;
            this.enemies = null;
            this.createdEnemies = null;
            this.createdEnemiesIndex = null;
            if (this.infoImg && this.infoImg.hasEventListener(MouseEvent.CLICK))
            {
                this.infoImg.removeEventListener(MouseEvent.CLICK, this.infoImgClick);
            }
            if (this.infoImg && this.infoImg.parent)
            {
                this.infoImg.parent.removeChild(this.infoImg);
            }
            if (this.waveInfo && this.waveInfo.parent)
            {
                this.waveInfo.parent.removeChild(this.waveInfo);
            }
            this.infoImg = null;
            return;
        }// end function

        public function initialize(param1:XML) : void
        {
            var _loc_2:XML = null;
            var _loc_3:String = null;
            var _loc_4:Number = NaN;
            var _loc_5:String = null;
            var _loc_6:Array = null;
            var _loc_7:int = 0;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:int = 0;
            var _loc_13:int = 0;
            this.lifeTime = parseFloat(param1.attribute("lifeTime")) * 1000;
            if (param1.attribute("preStartMoney") != undefined)
            {
                this.preStartMoney = parseInt(param1.attribute(this.preStartMoney));
            }
            else
            {
                this.preStartMoney = this.waveGroup.manager.preStartMoney;
            }
            this.createTime = Level.gameTime + this.waveGroup.manager.infoImgLifeTime + this.waveGroup.pause;
            if (param1.attribute("pause") != undefined)
            {
                this.createTime = this.createTime + parseFloat(param1.attribute("pause")) * 1000;
            }
            this.infoImgCreateTime = this.createTime - this.waveGroup.manager.infoImgLifeTime;
            if (param1.attribute("side") != undefined)
            {
                this.side = param1.attribute("side");
            }
            if (param1.attribute("img") != undefined)
            {
                this.imgInd = parseInt(param1.attribute("img"));
            }
            for each (_loc_2 in param1.enemy)
            {
                
                _loc_3 = _loc_2.attribute("name");
                _loc_4 = parseFloat(_loc_2.attribute("delay")) * 1000;
                _loc_5 = this.side;
                if (_loc_2.attribute("side") != undefined)
                {
                    _loc_5 = _loc_2.attribute("side");
                }
                if (_loc_3.indexOf("line") != -1)
                {
                    _loc_6 = _loc_3.split("-");
                    _loc_7 = parseInt(_loc_6[2]);
                    _loc_3 = _loc_6[0];
                    _loc_8 = 10;
                    _loc_9 = 207 - Math.floor(_loc_7 / 2) * _loc_8;
                    if (_loc_7 % 2 == 0)
                    {
                        _loc_9 = _loc_9 + _loc_8 / 2;
                    }
                    _loc_10 = 0;
                    _loc_11 = _loc_5 == "left" ? (12) : (-12);
                    _loc_12 = Math.floor(_loc_7 / 2);
                    _loc_13 = 0;
                    while (_loc_13 < _loc_7)
                    {
                        
                        this.addEnemy(_loc_3, _loc_4, _loc_5, _loc_9 + _loc_13 * _loc_8, _loc_10);
                        if (_loc_13 == _loc_12)
                        {
                            _loc_11 = _loc_11 * -1;
                        }
                        if (_loc_13 == (_loc_12 - 1) && _loc_7 % 2 == 0)
                        {
                        }
                        else
                        {
                            _loc_10 = _loc_10 + _loc_11;
                        }
                        _loc_13++;
                    }
                    continue;
                }
                this.addEnemy(_loc_3, _loc_4, _loc_5);
            }
            return;
        }// end function

        private function addEnemy(param1:String, param2:Number, param3:String, param4:Number = 0, param5:Number = 0) : void
        {
            var _loc_6:Object = {name:param1, delay:param2, side:param3, y:param4, x:param5};
            this.enemies.push(_loc_6);
            return;
        }// end function

        public function createInfoImgFirst() : void
        {
            this.createInfoImg(true);
            this.infoImgCreateTime = Level.gameTime - this.waveGroup.manager.infoImgLifeTime;
            this.createTime = Level.gameTime;
            return;
        }// end function

        public function createInfoImg(param1:Boolean = false) : void
        {
            var _loc_6:String = null;
            var _loc_7:int = 0;
            this.isInfoImgCreated = true;
            if (param1)
            {
                if (this.side == "left")
                {
                    this.infoImg = new waveIcon1StartLeft();
                }
                else
                {
                    this.infoImg = new waveIcon1StartRight();
                }
                this.infoImg.gotoAndStop(1);
            }
            else if (this.side == "left")
            {
                this.infoImg = new waveIcon1Left();
            }
            else
            {
                this.infoImg = new waveIcon1Right();
            }
            this.infoImg.buttonMode = true;
            this.infoImg.mouseChildren = false;
            this.waveGroup.manager.level.addChild(this.infoImg);
            this.infoImg.addEventListener(MouseEvent.CLICK, this.infoImgClick);
            this.infoImg.addEventListener(MouseEvent.MOUSE_OVER, this.showWaveInfo);
            this.infoImg.addEventListener(MouseEvent.MOUSE_OUT, this.hideWaveInfo);
            this.waveInfo = new WaveInfoPanel();
            this.waveInfo.mouseEnabled = false;
            this.waveInfo.mouseChildren = false;
            this.hideWaveInfo(null);
            var _loc_2:* = new Array();
            var _loc_3:int = 0;
            while (_loc_3 < this.enemies.length)
            {
                
                _loc_6 = Utilites.getUnitInfoName(this.enemies[_loc_3].name);
                _loc_7 = _loc_2.indexOf(_loc_6);
                if (_loc_7 == -1)
                {
                    _loc_2.push(_loc_6);
                    _loc_2.push(1);
                }
                else
                {
                    var _loc_8:* = _loc_2;
                    var _loc_10:* = _loc_2[++_loc_7] + 1;
                    _loc_8[++_loc_7] = _loc_10;
                }
                _loc_3++;
            }
            var _loc_4:String = "";
            var _loc_5:int = 0;
            while (_loc_5 < _loc_2.length)
            {
                
                _loc_4 = _loc_4 + (_loc_2[(_loc_5 + 1)] + "x " + _loc_2[_loc_5] + "\r");
                _loc_5 = _loc_5 + 2;
            }
            this.waveInfo.txt.autoSize = TextFieldAutoSize.LEFT;
            this.waveInfo.txt.text = _loc_4;
            this.waveInfo.txtWave.text = "Wave " + ((this.waveGroup.manager.getWaveGroupIndex() + 1)).toString();
            this.waveGroup.manager.level.addChild(this.waveInfo);
            this.waveInfo.bg.width = this.waveInfo.txt.textWidth + 30;
            this.waveInfo.bg.height = this.waveInfo.txt.textHeight + 30;
            this.waveInfo.y = 50 - this.waveInfo.bg.height / 2;
            if (this.side == "left")
            {
                this.infoImg.x = -440;
                this.waveInfo.x = -285;
                TweenLite.to(this.infoImg, 1.5, {x:-380, ease:Elastic.easeOut});
            }
            else
            {
                this.infoImg.x = 440;
                this.waveInfo.x = this.infoImg.x - 80 - this.waveInfo.txt.textWidth;
                TweenLite.to(this.infoImg, 1.5, {x:350, ease:Elastic.easeOut});
            }
            return;
        }// end function

        private function showWaveInfo(event:MouseEvent) : void
        {
            if (event && (this.infoImg is waveIcon1StartRight || this.infoImg is waveIcon1StartLeft))
            {
                this.infoImg.gotoAndStop(2);
            }
            this.waveInfo.visible = true;
            return;
        }// end function

        private function hideWaveInfo(event:MouseEvent) : void
        {
            if (event && (this.infoImg is waveIcon1StartRight || this.infoImg is waveIcon1StartLeft))
            {
                this.infoImg.gotoAndStop(1);
            }
            this.waveInfo.visible = false;
            return;
        }// end function

        private function infoImgClick(event:MouseEvent) : void
        {
            var addMoney:int;
            var txtAdd:MovieClip;
            var e:* = event;
            if (e && (this.infoImg is waveIcon1Right || this.infoImg is waveIcon1Left))
            {
                addMoney = (1 - this.infoImg.crck.mc_percents.currentFrame / this.infoImg.crck.mc_percents.totalFrames) * this.preStartMoney;
                if (addMoney > 0)
                {
                    this.waveGroup.manager.level.money = this.waveGroup.manager.level.money + addMoney;
                    txtAdd = new TextAddMoney();
                    txtAdd.txt.text = "+ $" + addMoney;
                    txtAdd.y = this.infoImg.y - 30;
                    this.infoImg.parent.addChild(txtAdd);
                    txtAdd.x = this.side == "right" ? (350) : (-350);
                    TweenLite.to(txtAdd, 3, {y:txtAdd.y - 50, alpha:0.2, onComplete:function ()
            {
                txtAdd.parent.removeChild(txtAdd);
                return;
            }// end function
            });
                }
            }
            this.createWave();
            return;
        }// end function

        private function createWave() : void
        {
            this.isCreated = true;
            this.endTime = Level.gameTime + this.lifeTime;
            this.waveGroup.onWaveCreated();
            this.infoImg.removeEventListener(MouseEvent.CLICK, this.infoImgClick);
            TweenLite.to(this.infoImg, 0.3, {alpha:0, onComplete:function ()
            {
                waveGroup.manager.level.removeChild(infoImg);
                return;
            }// end function
            });
            if (this.waveGroup.manager.level.helps.currentHint == 12)
            {
                this.waveGroup.manager.level.helps.hideHint();
            }
            return;
        }// end function

        public function isTimeEnded() : Boolean
        {
            return this.isCreated && this.endTime <= Level.gameTime;
        }// end function

        public function isEnded() : Boolean
        {
            var _loc_1:Boolean = false;
            var _loc_2:Boolean = false;
            if (this.isCreated)
            {
                _loc_1 = this.createdEnemiesIndex.length == this.enemies.length;
                _loc_2 = _loc_1 && this.createdEnemies.length == 0;
                if (_loc_2 || this.isTimeEnded() && _loc_1)
                {
                    return true;
                }
            }
            return false;
        }// end function

        public function update() : void
        {
            var _loc_1:int = 0;
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:Object = null;
            var _loc_5:Enemy = null;
            if (!this.isInfoImgCreated && Level.gameTime >= this.infoImgCreateTime)
            {
                this.createInfoImg();
            }
            if (!this.isCreated && Level.gameTime >= this.createTime)
            {
                this.createWave();
            }
            if (this.isInfoImgCreated && !this.isCreated && (this.infoImg is waveIcon1Right || this.infoImg is waveIcon1Left))
            {
                _loc_1 = (Level.gameTime - this.infoImgCreateTime) / this.waveGroup.manager.infoImgLifeTime * this.infoImg.crck.mc_percents.totalFrames;
                this.infoImg.crck.mc_percents.gotoAndStop(_loc_1);
            }
            if (this.isCreated)
            {
                this.time = this.time + Level.deltaTime;
                _loc_2 = 0;
                while (_loc_2 < this.enemies.length)
                {
                    
                    _loc_4 = this.enemies[_loc_2];
                    if (_loc_4.delay <= this.time && this.createdEnemiesIndex.indexOf(_loc_2) == -1 && this.waveGroup.manager.level.state == GameState.GAME)
                    {
                        _loc_5 = this.waveGroup.manager.createEnemy(_loc_4.name, _loc_4.side, _loc_4.y, _loc_4.x);
                        this.createdEnemies.push(_loc_5);
                        this.createdEnemiesIndex.push(_loc_2);
                        if (_loc_5 is Parashutist)
                        {
                            Parashutist(_loc_5).wave = this;
                        }
                    }
                    _loc_2++;
                }
                _loc_3 = this.createdEnemies.length - 1;
                while (_loc_3 >= 0)
                {
                    
                    if (!this.createdEnemies[_loc_3].alive)
                    {
                        this.createdEnemies.splice(_loc_3, 1);
                    }
                    _loc_3 = _loc_3 - 1;
                }
            }
            return;
        }// end function

        public function replaceEnemy(param1:Enemy, param2:Enemy) : void
        {
            var _loc_3:* = this.createdEnemies.indexOf(param1);
            if (_loc_3 > -1)
            {
                this.createdEnemies.splice(_loc_3, 1);
                this.createdEnemies.push(param2);
            }
            return;
        }// end function

    }
}
