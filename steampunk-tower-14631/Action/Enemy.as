package 
{
    import Enemy.*;
    import __AS3__.vec.*;
    import flash.geom.*;
    import flash.text.*;

    public class Enemy extends CollisionObject
    {
        public var modifers:Object;
        public var isAir:Boolean = false;
        public var preHealth:Number;
        public var maxHealth:Number;
        public var armor:Number = 30;
        public var health:Number = 30;
        public var money:Number = 10;
        public var minDamage:Number = 1;
        public var maxDamage:Number = 1;
        public var infoName:String;
        protected var speed:Number = -1;
        protected var bottomOffset:Number = 0;
        protected var forwardOffset:Number = 0;
        protected var healthY:Number = 0;
        protected var healthW:Number = 50;
        public var stopX:Number = 120;
        public var selectRct:Rectangle;
        protected var index:int = 0;
        public var level:Level;
        public var state:int = 0;
        public var line:int = 1;
        public var alive:Boolean = true;
        protected var mcName:String;
        protected var mcEnemy:RastrMovieClip;
        protected var effects:Vector.<RastrMovieClip>;
        protected var effectsTimer:Vector.<int>;
        protected var walk1:int = -1;
        protected var walk2:int = -1;
        protected var aim1:int = -1;
        protected var aim2:int = -1;
        protected var shootFrame:int = -1;
        protected var shoot1:int = -1;
        protected var shoot2:int = -1;
        protected var die1:int = -1;
        protected var die2:int = -1;
        protected var shootSpeed:Number = 2000;
        protected var reloadCounter:int = 0;
        protected var _side:String = "right";
        protected var fireMc:RastrMovieClip;
        protected var shockMc:RastrMovieClip;
        protected var fireEffect:String = "FireTank";
        protected var shockEffect:String = "ShockTank";
        protected var isFire:Boolean = false;
        protected var isShock:Boolean = false;
        protected var shockSlow:Number = 0.25;
        protected var fireDamage:Number = 10;
        protected var shockDamage:Number = 7;
        public var shockKof:Number = 1;
        protected const fireTime:Number = 5000;
        protected const shockTime:Number = 5000;
        protected var fireTimeCounter:Number = 0;
        protected var shockTimeCounter:Number = 0;
        protected var txtInfo:TextField;
        private var lastHealth:Number = 0;
        private var drawHealthCounter:Number = 0;

        public function Enemy()
        {
            this.modifers = {gunIgnore:0, heavyIgnore:0, sawIgnore:0, lightIgnore:0, gunAdd:0, heavyAdd:0, sawAdd:0, lightAdd:0};
            this.effects = new Vector.<RastrMovieClip>;
            this.effectsTimer = new Vector.<int>;
            return;
        }// end function

        public function get preAlive() : Boolean
        {
            return this.preHealth > 0;
        }// end function

        public function get damage() : Number
        {
            return Utilites.randomNumber(this.minDamage, this.maxDamage);
        }// end function

        public function get side() : String
        {
            return this._side;
        }// end function

        public function set side(param1:String) : void
        {
            if (this.side != param1)
            {
                scaleX = scaleX * -1;
                this.speed = this.speed * -1;
                this.stopX = this.stopX * -1;
            }
            this._side = param1;
            return;
        }// end function

        public function getBottom() : Number
        {
            return this.levelY + this.bottomOffset;
        }// end function

        public function getForward() : Number
        {
            return this.levelX + this.forwardOffset * scaleX;
        }// end function

        public function get globalX() : Number
        {
            return this.level.x + this.levelX;
        }// end function

        public function get globalY() : Number
        {
            return this.level.y + this.levelY;
        }// end function

        public function get levelX() : Number
        {
            return x;
        }// end function

        public function get levelY() : Number
        {
            return y;
        }// end function

        protected function fireUp() : void
        {
            if (!this.isFire && this.health > 0)
            {
                this.fireMc = Main.rastFactory.getMovieClip(this.fireEffect + "-" + this.side);
                this.addEffect(this.fireMc, int.MAX_VALUE);
                this.isFire = true;
                this.fireTimeCounter = this.fireTime;
            }
            return;
        }// end function

        private function removeFire() : void
        {
            if (this.isFire)
            {
                this.isFire = false;
                this.removeEffect(this.fireMc);
            }
            return;
        }// end function

        protected function shockUp() : void
        {
            if (!this.isShock && this.health > 0)
            {
                this.shockMc = Main.rastFactory.getMovieClip(this.shockEffect + "-" + this.side);
                this.addEffect(this.shockMc, int.MAX_VALUE);
                this.isShock = true;
                this.shockTimeCounter = this.shockTime;
            }
            return;
        }// end function

        private function removeShock() : void
        {
            if (this.isShock)
            {
                this.isShock = false;
                this.removeEffect(this.shockMc);
            }
            return;
        }// end function

        public function addEffect(param1:RastrMovieClip, param2:int) : void
        {
            addChild(param1);
            this.effects.push(param1);
            this.effectsTimer.push(param2);
            return;
        }// end function

        public function removeEffect(param1:RastrMovieClip)
        {
            removeChild(param1);
            var _loc_2:* = this.effects.indexOf(param1);
            this.effects.splice(_loc_2, 1);
            this.effectsTimer.splice(_loc_2, 1);
            return;
        }// end function

        public function initialize(param1:Level) : void
        {
            this.level = param1;
            this.mcEnemy = Main.rastFactory.getMovieClip(this.mcName + "-" + this.side);
            this.mcEnemy.initialize();
            addChild(this.mcEnemy);
            this.mcEnemy.gotoAndPlay(Utilites.randomInt(this.walk1, this.walk2));
            this.maxHealth = this.health;
            this.preHealth = this.health;
            this.bottomOffset = this.mcEnemy.mcBounds.bottom;
            this.forwardOffset = this.side == "right" ? (this.mcEnemy.mcBounds.left) : (-this.mcEnemy.mcBounds.right);
            this.healthY = this.mcEnemy.mcBounds.top;
            this.healthW = this.mcEnemy.mcBounds.width;
            this.stopX = this.stopX + Utilites.randomInt(-10, 40);
            x = (400 - this.forwardOffset + 30) * scaleX;
            this.txtInfo = new TextField();
            this.txtInfo.y = 10;
            this.txtInfo.selectable = false;
            this.txtInfo.mouseEnabled = false;
            return;
        }// end function

        protected function drawCollideRadius() : void
        {
            graphics.clear();
            var _loc_1:int = 0;
            while (_loc_1 < collideRadiuses.length)
            {
                
                collideRadiuses[_loc_1].draw();
                _loc_1++;
            }
            return;
        }// end function

        public function update() : void
        {
            this.txtInfo.x = this.levelX;
            this.txtInfo.y = this.levelY + 10;
            if (this.isFire && this.level.everyMs(1000))
            {
                this.health = this.health - this.fireDamage;
                this.fireTimeCounter = this.fireTimeCounter - 1000;
                if (this.fireTimeCounter <= 0)
                {
                    this.removeFire();
                }
            }
            if (this.isShock && this.level.everyMs(1000))
            {
                this.health = this.health - this.shockDamage * this.shockKof;
                this.shockTimeCounter = this.shockTimeCounter - 1000;
                if (this.shockTimeCounter <= 0)
                {
                    this.removeShock();
                }
            }
            this.updateMove();
            this.updateAnimation();
            if (this.health < 0)
            {
                this.health = 0;
            }
            this.drawHealth();
            if (this.health <= 0 && this.alive)
            {
                this.die();
            }
            if (this.preHealth > this.health)
            {
                this.preHealth = this.health;
            }
            this.mcEnemy.update(this.level.bitmap.bitmapData);
            this.drawEffects();
            this.txtInfo.text = this.preHealth + "\n" + this.health + "\n";
            return;
        }// end function

        protected function drawEffects() : void
        {
            var _loc_1:* = this.effects.length - 1;
            while (_loc_1 >= 0)
            {
                
                this.effects[_loc_1].update(this.level.bitmap.bitmapData);
                var _loc_2:* = this.effectsTimer;
                var _loc_3:* = _loc_1;
                var _loc_4:* = this.effectsTimer[_loc_1] - 1;
                _loc_2[_loc_3] = _loc_4;
                if (this.effectsTimer[_loc_1] <= 0)
                {
                    this.removeEffect(this.effects[_loc_1]);
                    ;
                }
                _loc_1 = _loc_1 - 1;
            }
            return;
        }// end function

        protected function updateMove() : void
        {
            var _loc_1:Number = NaN;
            var _loc_2:Boolean = false;
            var _loc_3:Number = NaN;
            this.mcEnemy.animSpeed = 1;
            if (this.state == 0)
            {
                _loc_1 = x + this.forwardOffset * scaleX;
                _loc_2 = this.side == "left" && _loc_1 < this.stopX || this.side == "right" && _loc_1 > this.stopX;
                if (_loc_2 || this.mcEnemy.currentFrame != this.walk2)
                {
                    _loc_3 = this.speed;
                    if (this.isShock)
                    {
                        _loc_3 = _loc_3 * this.shockSlow;
                        this.mcEnemy.animSpeed = 2 * this.shockSlow;
                    }
                    if (!_loc_2)
                    {
                        _loc_3 = _loc_3 / 2;
                    }
                    x = x + _loc_3;
                }
                else
                {
                    this.state = 1;
                }
            }
            return;
        }// end function

        protected function updateAnimation() : void
        {
            if (this.state == 0 && this.walk2 != -1 && this.mcEnemy.currentFrame == (this.walk2 + 1))
            {
                this.mcEnemy.gotoAndPlay(this.walk1);
            }
            if (this.state == 1)
            {
                if (this.aim1 == -1 || this.mcEnemy.currentFrame == this.aim2)
                {
                    this.state = 2;
                }
            }
            if (this.state == 2)
            {
                if (this.shoot2 != -1 && (this.mcEnemy.currentFrame == (this.shoot2 + 1) || this.mcEnemy.currentFrame == 1))
                {
                    this.mcEnemy.gotoAndPlay(this.shoot1);
                }
                if (this.mcEnemy.currentFrame == this.shootFrame)
                {
                    this.shoot();
                }
                if (this.mcEnemy.currentFrame == this.shoot1 || this.mcEnemy.currentFrame == 1)
                {
                    this.state = 3;
                }
            }
            this.reloadCounter = this.reloadCounter - Level.deltaTime;
            if (this.state == 3)
            {
                if (this.mcEnemy.currentFrame == this.shoot1)
                {
                    this.stopShootAnimation();
                }
                if (this.reloadCounter <= 0 && !this.isShock || this.reloadCounter < (-this.shootSpeed) * (1 - this.shockSlow))
                {
                    this.state = 2;
                    this.playShootAnimation();
                    this.reloadCounter = this.shootSpeed;
                }
            }
            if (this.state == 4)
            {
                if (this.mcEnemy.currentFrame == this.die2)
                {
                    this.dispose();
                }
            }
            return;
        }// end function

        private function stopShootAnimation() : void
        {
            this.mcEnemy.stop();
            return;
        }// end function

        private function playShootAnimation() : void
        {
            this.mcEnemy.play();
            return;
        }// end function

        protected function drawHealth() : void
        {
            var _loc_1:Number = NaN;
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            if (this.alive)
            {
                if (this.health < this.lastHealth)
                {
                    this.drawHealthCounter = 1500;
                }
                if (this.drawHealthCounter > 0)
                {
                    _loc_1 = this.health / this.maxHealth;
                    _loc_2 = this.globalX - this.healthW / 2;
                    _loc_3 = Math.floor(this.globalY + this.healthY);
                    this.level.drawBar(_loc_2, _loc_3, 2, this.healthW, 0, 0.8);
                    this.level.drawBar(_loc_2, _loc_3, 2, this.healthW * _loc_1, 16711680, 0.8);
                    this.drawHealthCounter = this.drawHealthCounter - Level.deltaTime;
                }
                this.lastHealth = this.health;
            }
            return;
        }// end function

        protected function shoot() : void
        {
            this.level.health = this.level.health - this.damage;
            this.level.tower.addEffectRicoshet(this);
            SoundManager.playEnemyShoot(this);
            return;
        }// end function

        public function hit(param1:Number, param2:Bullet, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false) : Boolean
        {
            var _loc_9:Cannon = null;
            var _loc_10:AutoRemoveText = null;
            var _loc_11:Number = NaN;
            var _loc_7:Boolean = false;
            var _loc_8:int = 0;
            if (!(param2 is BulletEye))
            {
                _loc_9 = param2.cannon;
            }
            if (_loc_9 is CannonMachineGun)
            {
                if (this.modifers.gunIgnore > 0)
                {
                    _loc_7 = Math.random() < this.modifers.gunIgnore / 100;
                }
                _loc_8 = Math.floor(this.modifers.gunAdd / 100 * param1);
            }
            else if (_loc_9 is CannonHeavyGun)
            {
                if (this.modifers.heavyIgnore > 0)
                {
                    _loc_7 = Math.random() < this.modifers.heavyIgnore / 100;
                }
                _loc_8 = Math.floor(this.modifers.heavyAdd / 100 * param1);
            }
            else if (_loc_9 is CannonSawGun)
            {
                if (this.isShock)
                {
                    if (!param5)
                    {
                        param5 = true;
                        this.preHealth = this.preHealth - param1;
                        param1 = param1 * 2;
                    }
                }
                else if (this.modifers.sawIgnore > 0)
                {
                    _loc_7 = Math.random() < this.modifers.sawIgnore / 100;
                }
                _loc_8 = Math.floor(this.modifers.sawAdd / 100 * param1);
            }
            else if (_loc_9 is CannonElectroGun)
            {
                if (this.modifers.lightIgnore > 0)
                {
                    _loc_7 = Math.random() < this.modifers.lightIgnore / 100;
                }
                _loc_8 = Math.floor(this.modifers.lightAdd / 100 * param1);
            }
            if (_loc_7 && this.alive)
            {
                this.preHealth = this.preHealth + param1;
                _loc_10 = new AutoRemoveText("ignore", 1300);
                if (this.isAir)
                {
                    _loc_10.textField.text = "miss";
                }
                _loc_10.x = x;
                _loc_10.y = y + this.healthY;
                this.level.addChild(_loc_10);
                _loc_10.color = 16711680;
                return false;
            }
            else if (!param6)
            {
                this.health = this.health - (param1 + _loc_8);
                this.preHealth = this.preHealth - _loc_8;
                if (this.health <= 0)
                {
                    this.die(param2);
                }
                if (param3)
                {
                    this.fireUp();
                }
                if (param4)
                {
                    this.shockUp();
                }
                _loc_11 = this.lastHealth - this.health;
                _loc_10 = new AutoRemoveText(Math.floor(_loc_11).toString(), 1300);
                _loc_10.x = x;
                _loc_10.y = y + this.healthY;
                this.level.addChild(_loc_10);
                if (_loc_9 == null)
                {
                    _loc_10.color = 16711680;
                }
                if (param5)
                {
                    _loc_10.color = 16711680;
                }
            }
            return true;
        }// end function

        protected function die(param1:Bullet = null) : void
        {
            var _loc_2:int = 0;
            var _loc_3:AutoRemoveText = null;
            if (this.alive)
            {
                if (!Level.isChallenge)
                {
                    if (!(this is Bird))
                    {
                        var _loc_4:* = Saves.curSaves;
                        var _loc_5:* = Saves.curSaves.enemiesCount + 1;
                        _loc_4.enemiesCount = _loc_5;
                        if (param1)
                        {
                            if (param1.isCritical)
                            {
                                var _loc_4:* = Saves.curSaves;
                                var _loc_5:* = Saves.curSaves.enemiesCountCrit + 1;
                                _loc_4.enemiesCountCrit = _loc_5;
                            }
                            if (param1 is BulletElectroGun1 && BulletElectroGun1(param1).chainInd > 1)
                            {
                                var _loc_4:* = Saves.curSaves;
                                var _loc_5:* = Saves.curSaves.enemiesCountChain + 1;
                                _loc_4.enemiesCountChain = _loc_5;
                            }
                            if (param1 is BulletHeavyGun && param1.target != this)
                            {
                                var _loc_4:* = Saves.curSaves;
                                var _loc_5:* = Saves.curSaves.enemiesCountSplash + 1;
                                _loc_4.enemiesCountSplash = _loc_5;
                            }
                            if (param1 is BulletSawGun1 && param1.isCritical)
                            {
                                if (this.isFire)
                                {
                                    Achivements.critFire = true;
                                }
                                if (this.isShock)
                                {
                                    Achivements.critShock = true;
                                }
                            }
                        }
                    }
                    else
                    {
                        var _loc_4:* = Saves.curSaves;
                        var _loc_5:* = Saves.curSaves.enemiesCountBirds + 1;
                        _loc_4.enemiesCountBirds = _loc_5;
                    }
                }
                _loc_2 = this.money + this.money * Upgrades.tower.moneyEnemy;
                this.level.money = this.level.money + _loc_2;
                _loc_3 = new AutoRemoveText("+" + _loc_2, 600);
                _loc_3.x = -348;
                _loc_3.y = -180;
                _loc_3.textField.setTextFormat(new TextFormat("Verdana", 15, 16750848, true));
                this.level.addChild(_loc_3);
                this.alive = false;
                this.state = 4;
                this.removeFire();
                this.removeShock();
                this.createDieEffect();
                if (this.die1 != -1)
                {
                    this.mcEnemy.gotoAndPlay(this.die1);
                }
                else
                {
                    this.dispose();
                }
                SoundManager.playEnemyDie(this, param1);
            }
            return;
        }// end function

        protected function createDieEffect() : void
        {
            var _loc_1:* = Main.rastFactory.getMovieClip("Explode");
            _loc_1.y = this.bottomOffset;
            this.addEffect(_loc_1, _loc_1.totalFrames);
            return;
        }// end function

        public function dispose() : void
        {
            this.level.enemies.splice(this.level.enemies.indexOf(this), 1);
            if (parent)
            {
                parent.removeChild(this);
            }
            if (this.txtInfo.parent)
            {
                this.txtInfo.parent.removeChild(this.txtInfo);
            }
            return;
        }// end function

    }
}
