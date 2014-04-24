package 
{
    import Cannon.*;
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;

    public class Cannon extends MovieClip
    {
        public var exp_upgr2:MovieClip;
        public var exp_upgr3:MovieClip;
        public var reload_arrow:MovieClip;
        public var exp_upgr1:MovieClip;
        public var bg:MovieClip;
        public var bar_exp:MovieClip;
        public var bar_bullets:MovieClip;
        public var totalMoney:int = 0;
        public var type:int = 1;
        public var cell:Cell;
        public var isAnimating:Boolean = false;
        public var animDir:Point;
        protected var experience:int = 0;
        protected var prevExperience:int = 0;
        protected var needExperience:int = 0;
        protected var experienceCount:int = 1;
        protected var upgradeCount:int = -1;
        private var showUpgrIcons:Boolean = false;
        public var isPodval:Boolean = false;
        public var twr:MovieClip;
        protected var _bulletPos:Point;
        protected var deafultBulletPoints:Array;
        protected var _bulletPos2:Point;
        public var health:Number = 100;
        public var money:Number = 100;
        public var minDmg:Number = 1;
        public var maxDmg:Number = 2;
        public var reload:Number = 3000;
        protected var _bullets:int = 3;
        protected var _speed:Number = 2000;
        protected var _distance:Number = 500;
        protected var damage:int = 0;
        protected var isCrit:Boolean = false;
        protected var upgr:Array;
        protected var upgr1:Array;
        protected var upgr2:Array;
        protected var upgr3_1:Array;
        protected var upgr4_1:Array;
        protected var upgr3_2:Array;
        protected var upgr4_2:Array;
        public var modifers:Object;
        protected var modifers1:Object;
        protected var modifers2:Object;
        protected var modifers3_1:Object;
        protected var modifers4_1:Object;
        protected var modifers3_2:Object;
        protected var modifers4_2:Object;
        public var state:int = 0;
        protected var speedCounter:int = 0;
        public var bulletsCounter:int = 0;
        protected var reloadCounter:int = 0;
        protected var maxHealth:Number;
        protected var rotationSpeed:Number = 8;
        protected var canFire:Boolean = false;
        protected var maxDtAng:Number = 5;
        protected var minAng:Number = -75;
        protected var maxAng:Number = 75;
        protected var oneBulletReloadCounter:int = 0;
        protected var oneBulletReloadTime:int = 0;
        protected var oneBulletReloadSlow:int = 3;
        protected var xOffsets:Array;
        protected var upgradesNames:Array;
        protected var upgradeName:String = "gun1";
        public var upgradeInd:int = 0;
        protected var nextUpgrMinPrice:Number = 0;
        public var mcCannon:MovieClip;
        protected var prevCol:int = -1;
        protected var shootFrame:int = 3;
        protected var readyShootFrame:int = 1;
        protected var reloadFrame:int = 1;
        protected var animTime:Number = 0;
        protected var timeToShoot:Number = 0;
        protected var timeAfterShoot:Number = 0;
        public var level:Level;
        protected var curEnemy:Enemy;
        public var minEnemyX:Number = 0;
        private const timeToRotate:Number = 3000;
        private var timeToRotateCounter:Number = 0;
        protected var targetAngle:Number = 0;
        protected var dtFireAngle:Number = 3;

        public function Cannon()
        {
            this.animDir = new Point();
            this.deafultBulletPoints = [new Point(24.1, -7.2), new Point(40.1, -4.9), new Point(34.4, -12.5), new Point(31.8, -9.5), new Point(36.4, -12), new Point(42.3, -12.8)];
            this._bulletPos2 = new Point();
            this.upgr1 = [100, 100, "50-70", 2000, 3, 3000, 200, 111];
            this.upgr2 = [100, 100, "50-70", 2000, 3, 3000, 200, 222];
            this.upgr3_1 = [100, 100, "50-70", 2000, 3, 3000, 200, 333];
            this.upgr4_1 = [100, 100, "50-70", 2000, 3, 3000, 200, 444];
            this.upgr3_2 = [100, 100, "50-70", 2000, 3, 3000, 200, 333];
            this.upgr4_2 = [100, 100, "50-70", 2000, 3, 3000, 200, 444];
            this.modifers = {};
            this.modifers1 = {};
            this.modifers2 = {};
            this.modifers3_1 = {};
            this.modifers4_1 = {};
            this.modifers3_2 = {};
            this.modifers4_2 = {};
            this.upgradesNames = ["gun1", "gun2", "gun3-1", "gun4-1", "gun3-2", "gun4-2"];
            return;
        }// end function

        public function getBulletPos() : Point
        {
            return this.twr.localToGlobal(this._bulletPos);
        }// end function

        protected function getBulletPos2() : Point
        {
            return this.twr.localToGlobal(this._bulletPos2);
        }// end function

        public function get distance() : Number
        {
            return this._distance;
        }// end function

        public function get speed() : Number
        {
            return this._speed;
        }// end function

        public function get bullets() : int
        {
            return this._bullets;
        }// end function

        public function getDamage() : Number
        {
            return this.damage;
        }// end function

        public function getIsCrit() : Boolean
        {
            return false;
        }// end function

        public function getScaleX() : Number
        {
            return this.mcCannon.scaleX;
        }// end function

        public function getUpgradeParams(param1:int) : Array
        {
            if (param1 == 0)
            {
                return this.upgr1;
            }
            if (param1 == 1)
            {
                return this.upgr2;
            }
            if (param1 == 2)
            {
                return this.upgr3_1;
            }
            if (param1 == 3)
            {
                return this.upgr3_2;
            }
            if (param1 == 4)
            {
                return this.upgr4_1;
            }
            if (param1 == 5)
            {
                return this.upgr4_2;
            }
            return null;
        }// end function

        public function getUpgradePrice(param1:int) : int
        {
            if (param1 == 0)
            {
                return this.upgr1[1];
            }
            if (param1 == 1)
            {
                return this.upgr2[1];
            }
            if (param1 == 2)
            {
                return this.upgr3_1[1];
            }
            if (param1 == 3)
            {
                return this.upgr4_1[1];
            }
            if (param1 == 4)
            {
                return this.upgr3_2[1];
            }
            if (param1 == 5)
            {
                return this.upgr4_2[1];
            }
            return 0;
        }// end function

        public function initialize(param1:Level) : void
        {
            this.initializeData();
            this.level = param1;
            mouseChildren = false;
            this.bg.width = Cell.WIDTH;
            this.bg.height = Cell.HEIGHT;
            this.bulletsCounter = this.bullets;
            this.twr = this.mcCannon.turr.twr;
            this.animTime = this.twr.fr.totalFrames / param1.stage.frameRate * 1000;
            this.timeToShoot = this.shootFrame / param1.stage.frameRate * 1000;
            this.timeAfterShoot = this.animTime - this.timeToShoot;
            this.mcCannon.stop();
            this.mcCannon.y = Cell.HEIGHT;
            addChildAt(this.mcCannon, 0);
            this.needExperience = this.upgr1[7];
            this.setUpgrade(this.upgradeInd);
            this.mcCannon.x = Cell.WIDTH - this.xOffsets[this.upgradeInd];
            this.changeCol();
            addEventListener(MouseEvent.MOUSE_OVER, this.showStateInfo, false, 0, true);
            addEventListener(MouseEvent.MOUSE_OUT, this.hideStateInfo, false, 0, true);
            this.hideStateInfo();
            if (this.upgradeInd > 0)
            {
                if (this.upgradeInd == 1)
                {
                    this.needExperience = this.upgr2[7];
                }
                else if (this.upgradeInd == 2)
                {
                    this.needExperience = this.upgr3_1[7];
                }
                else if (this.upgradeInd == 3)
                {
                    this.needExperience = this.upgr4_1[7];
                }
            }
            return;
        }// end function

        private function showStateInfo(event:MouseEvent) : void
        {
            this.bar_exp.visible = true;
            this.bar_bullets.visible = true;
            this.showUpgrIcons = true;
            return;
        }// end function

        public function hideStateInfo(event:MouseEvent = null) : void
        {
            if (this.level.tower.dragBlock != this)
            {
                this.bar_exp.visible = false;
                this.bar_bullets.visible = false;
                this.showUpgrIcons = false;
            }
            return;
        }// end function

        public function initializeData() : void
        {
            return;
        }// end function

        private function traceCoords(event:MouseEvent) : void
        {
            var _loc_2:* = this.twr.globalToLocal(new Point(stage.mouseX, stage.mouseY));
            return;
        }// end function

        protected function readParams() : void
        {
            this.health = this.upgr[0];
            this.maxHealth = this.health;
            this.money = this.upgr[1];
            this._speed = this.upgr[3];
            this._bullets = this.upgr[4];
            this.bulletsCounter = this.bullets;
            this.reload = this.upgr[5];
            this._distance = this.upgr[6];
            var _loc_1:* = this.upgr[2].split("-");
            this.minDmg = parseFloat(_loc_1[0]);
            this.maxDmg = parseFloat(_loc_1[1]);
            this.oneBulletReloadTime = Math.floor(this.reload / this.bullets);
            return;
        }// end function

        public function canUpgrade() : Boolean
        {
            return this.experienceCount > 0;
        }// end function

        public function addExperience(param1:int) : void
        {
            var _loc_2:* = param1 * Upgrades.tower.experience;
            this.experience = this.experience + param1;
            return;
        }// end function

        public function setUpgrade(param1:int) : void
        {
            var _loc_2:Number = NaN;
            this.upgradeInd = param1;
            this._bulletPos = this.deafultBulletPoints[this.upgradeInd];
            this._bulletPos2.x = this._bulletPos.x - 20;
            this._bulletPos2.y = this._bulletPos.y;
            this.upgradeName = this.upgradesNames[param1];
            this.mcCannon.gotoAndStop(this.upgradeName);
            this.changeCol();
            this.stopFire();
            this.speedCounter = 0;
            if (this.type == 4)
            {
                this.shootFrame = this.twr.fr.totalFrames;
            }
            switch(this.upgradeInd)
            {
                case 0:
                {
                    this.upgr = this.upgr1;
                    this.modifers = this.modifers1;
                    this.nextUpgrMinPrice = this.getUpgradePrice(1);
                    this.upgradeCount = 0;
                    break;
                }
                case 1:
                {
                    this.upgr = this.upgr2;
                    this.modifers = this.modifers2;
                    this.nextUpgrMinPrice = this.getUpgradePrice(2);
                    _loc_2 = this.getUpgradePrice(4);
                    if (_loc_2 < this.nextUpgrMinPrice && this.level.levelManager.upgradeTwo)
                    {
                        this.nextUpgrMinPrice = _loc_2;
                    }
                    this.upgradeCount = 1;
                    break;
                }
                case 2:
                {
                    this.upgr = this.upgr3_1;
                    this.modifers = this.modifers3_1;
                    this.nextUpgrMinPrice = this.getUpgradePrice(3);
                    this.upgradeCount = 2;
                    break;
                }
                case 3:
                {
                    this.upgr = this.upgr4_1;
                    this.modifers = this.modifers4_1;
                    this.nextUpgrMinPrice = 0;
                    this.upgradeCount = 3;
                    break;
                }
                case 4:
                {
                    this.upgr = this.upgr3_2;
                    this.modifers = this.modifers3_2;
                    this.nextUpgrMinPrice = this.getUpgradePrice(5);
                    this.upgradeCount = 2;
                    break;
                }
                case 5:
                {
                    this.upgr = this.upgr4_2;
                    this.modifers = this.modifers4_2;
                    this.nextUpgrMinPrice = 0;
                    this.upgradeCount = 3;
                    break;
                }
                default:
                {
                    break;
                }
            }
            this.readParams();
            var _loc_3:String = this;
            var _loc_4:* = this.experienceCount - 1;
            _loc_3.experienceCount = _loc_4;
            this.state = 3;
            this.mcCannon.transform.colorTransform = new ColorTransform();
            this.bulletsCounter = this.bullets;
            return;
        }// end function

        public function findEnemy() : void
        {
            var _loc_1:Enemy = null;
            var _loc_2:Enemy = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:int = 0;
            var _loc_6:Enemy = null;
            var _loc_7:Boolean = false;
            var _loc_8:Number = NaN;
            if (!this.curEnemy)
            {
                _loc_1 = null;
                _loc_2 = null;
                _loc_3 = this.minEnemyX;
                _loc_4 = this.minEnemyX;
                _loc_5 = 0;
                while (_loc_5 < this.level.enemies.length)
                {
                    
                    _loc_6 = this.level.enemies[_loc_5];
                    _loc_7 = this.type != 2 || !_loc_6.isAir;
                    if (_loc_7 && _loc_6.alive && _loc_6.preAlive && this.canShootEnemy(_loc_6) && (_loc_6.levelX < 0 && this.cell.col == 0 || _loc_6.levelX > 0 && this.cell.col == 2))
                    {
                        _loc_8 = _loc_6.getForward();
                        if (this.cell.col == 0 && _loc_8 > _loc_3 || this.cell.col == 2 && _loc_8 < _loc_3)
                        {
                            _loc_1 = _loc_6;
                            _loc_3 = _loc_8;
                        }
                        if (!(_loc_6 is Parashutist))
                        {
                            if (this.cell.col == 0 && _loc_8 > _loc_4 || this.cell.col == 2 && _loc_8 < _loc_4)
                            {
                                _loc_2 = _loc_6;
                                _loc_4 = _loc_8;
                            }
                        }
                    }
                    _loc_5++;
                }
                if (_loc_2 && _loc_1 is Parashutist)
                {
                    this.curEnemy = _loc_2;
                }
                else if (_loc_1)
                {
                    this.curEnemy = _loc_1;
                }
            }
            return;
        }// end function

        private function canShootEnemy(param1:Enemy) : Boolean
        {
            var _loc_2:Number = NaN;
            var _loc_3:int = 0;
            var _loc_4:Number = NaN;
            if (param1 is Parashutist)
            {
                _loc_2 = this.cell.row;
                _loc_3 = _loc_2 - 2;
                while (_loc_3 <= _loc_2 + 2)
                {
                    
                    if (param1.line == _loc_3)
                    {
                        _loc_4 = this.getAngToEnemy(param1);
                        return _loc_4 >= this.minAng && _loc_4 <= this.maxAng;
                    }
                    _loc_3++;
                }
                return false;
            }
            _loc_4 = this.getAngToEnemy(param1);
            return _loc_4 >= this.minAng && _loc_4 <= this.maxAng;
        }// end function

        public function update() : void
        {
            var _loc_1:int = 0;
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            this.twr = this.mcCannon.turr.twr;
            if (this.prevCol != this.cell.col)
            {
                this.changeCol();
            }
            if (this.state != 2 && this.state != 0)
            {
                if (!this.curEnemy || !this.curEnemy.alive || !this.curEnemy.preAlive)
                {
                    this.curEnemy = null;
                    this.findEnemy();
                }
            }
            if (this.curEnemy && this.state != 0)
            {
                if (this.cell.col == 0 && this.curEnemy.levelX < this.minEnemyX || this.cell.col == 2 && this.curEnemy.levelX > this.minEnemyX)
                {
                    this.curEnemy = null;
                    this.findEnemy();
                }
            }
            this.updateRotation();
            if (this.state == 0)
            {
                _loc_1 = this.twr.fr.currentFrame + 1;
                if (_loc_1 > this.twr.fr.totalFrames)
                {
                    _loc_1 = 1;
                }
                this.twr.fr.gotoAndStop(_loc_1);
                if (this.twr.fr.currentFrame == this.reloadFrame)
                {
                    this.twr.fr.stop();
                    if (this.bulletsCounter <= 0)
                    {
                        HintPanels.cannonFirstReload = true;
                        this.state = 2;
                        this.reloadCounter = this.reload;
                        this.mcCannon.transform.colorTransform = new ColorTransform(1, 1, 1, 0.9, -20, -20, -20);
                    }
                    else
                    {
                        this.state = 1;
                        this.speedCounter = this.speed - this.animTime;
                    }
                }
                if (this.twr.fr.currentFrame == this.shootFrame)
                {
                    this.shoot();
                    var _loc_4:String = this;
                    var _loc_5:* = this.bulletsCounter - 1;
                    _loc_4.bulletsCounter = _loc_5;
                }
            }
            if (this.state == 1)
            {
                this.speedCounter = this.speedCounter - Level.deltaTime;
                if (this.speedCounter <= 0)
                {
                    this.state = 3;
                    this.twr.fr.play();
                }
            }
            if (this.state == 3)
            {
                if (this.cell.col != 1)
                {
                    this.twr.fr.play();
                }
                else if (this.twr.fr.currentFrame > 1)
                {
                    this.twr.fr.prevFrame();
                }
                if (this.twr.fr.currentFrame == this.readyShootFrame)
                {
                    this.twr.fr.stop();
                    if (this.canFire && this.cell.col != 1 && !this.isAnimating && this.curEnemy && this.curEnemy.alive)
                    {
                        this.state = 0;
                        this.generateDamage();
                        this.twr.fr.gotoAndStop((this.readyShootFrame + 1));
                    }
                }
            }
            this.reload_arrow.visible = false;
            if (this.state == 2)
            {
                _loc_2 = Level.deltaTime;
                if (this.cell.col == 1)
                {
                    _loc_2 = _loc_2 * 2;
                }
                _loc_2 = _loc_2 + _loc_2 * Upgrades.tower.reloadTime;
                this.reloadCounter = this.reloadCounter - _loc_2;
                this.reload_arrow.visible = true;
                this.reload_arrow.rotation = this.reload_arrow.rotation + _loc_2 / 2;
                _loc_3 = 1 - this.reloadCounter / this.reload;
                this.bulletsCounter = Math.floor(this.bullets * _loc_3);
                if (this.reloadCounter <= 0)
                {
                    this.state = 1;
                    this.mcCannon.transform.colorTransform = new ColorTransform();
                    this.speedCounter = this.speed > 1000 ? (1000) : (this.speed);
                    this.bulletsCounter = this.bullets;
                }
            }
            else if (this.cell.col == 1 && this.bulletsCounter < this.bullets)
            {
                _loc_2 = Level.deltaTime / this.oneBulletReloadSlow;
                this.oneBulletReloadCounter = this.oneBulletReloadCounter + _loc_2;
                this.reload_arrow.visible = true;
                this.reload_arrow.rotation = this.reload_arrow.rotation + _loc_2 / 2;
                if (this.oneBulletReloadCounter >= this.oneBulletReloadTime)
                {
                    var _loc_4:String = this;
                    var _loc_5:* = this.bulletsCounter + 1;
                    _loc_4.bulletsCounter = _loc_5;
                    this.oneBulletReloadCounter = 0;
                }
            }
            else
            {
                this.reload_arrow.visible = false;
                this.oneBulletReloadCounter = 0;
            }
            this.drawBullets();
            this.updateExperience();
            return;
        }// end function

        protected function updateRotation() : void
        {
            if (this.cell.col == 1 || this.state == 2)
            {
                this.rotateToZero();
            }
            else if (this.curEnemy)
            {
                this.timeToRotateCounter = this.timeToRotate;
                this.rotateToPoint(this.curEnemy.globalX, this.curEnemy.globalY, this.rotationSpeed);
                if (this.targetAngle < this.minAng || this.targetAngle > this.maxAng)
                {
                    if (this.curEnemy && this.curEnemy.alive && this.twr.fr.currentFrame > this.readyShootFrame && this.twr.fr.currentFrame <= this.shootFrame)
                    {
                        this.curEnemy.preHealth = this.curEnemy.preHealth + this.damage;
                    }
                    this.curEnemy = null;
                }
            }
            else if (this.timeToRotateCounter > 0)
            {
                this.timeToRotateCounter = this.timeToRotateCounter - Level.deltaTime;
            }
            else
            {
                this.rotateToZero();
            }
            return;
        }// end function

        protected function rotateToZero() : void
        {
            var _loc_1:* = this.mcCannon.turr.localToGlobal(new Point(this.twr.x + 5, this.twr.y));
            this.rotateToPoint(_loc_1.x, _loc_1.y, this.rotationSpeed / 3);
            return;
        }// end function

        protected function rotateToPoint(param1:Number, param2:Number, param3:Number) : void
        {
            this.targetAngle = this.getAngToPoint(param1, param2);
            var _loc_4:* = this.targetAngle - this.twr.rotation;
            this.canFire = Math.abs(_loc_4) <= this.dtFireAngle;
            _loc_4 = Utilites.clamp(_loc_4, -param3, param3);
            this.twr.rotation = Utilites.clamp(this.twr.rotation + _loc_4, this.minAng, this.maxAng);
            return;
        }// end function

        protected function getAngToEnemy(param1:Enemy) : Number
        {
            return this.getAngToPoint(param1.globalX, param1.globalY);
        }// end function

        protected function getAngToPoint(param1:Number, param2:Number) : Number
        {
            var _loc_3:* = this.twr.localToGlobal(Utilites.ZERO_POINT);
            var _loc_4:* = param2 - _loc_3.y;
            var _loc_5:* = (param1 - _loc_3.x) * this.mcCannon.scaleX;
            return Math.atan2(_loc_4, _loc_5) / Utilites.RAD_TO_DEG;
        }// end function

        protected function drawHealth() : void
        {
            var _loc_1:* = this.health / this.maxHealth;
            var _loc_2:* = localToGlobal(new Point(0, 10));
            var _loc_3:* = Math.floor(_loc_2.y);
            this.level.drawBar(_loc_2.x, _loc_3, 3, Cell.WIDTH * _loc_1, 16711680, 0.7);
            return;
        }// end function

        protected function drawBullets() : void
        {
            var _loc_1:* = 1 - this.bulletsCounter / this._bullets;
            var _loc_2:* = 100 * _loc_1;
            this.bar_bullets.gotoAndStop(_loc_2);
            return;
        }// end function

        protected function updateExperience() : void
        {
            var _loc_2:int = 0;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:int = 0;
            var _loc_7:int = 0;
            var _loc_8:MovieClip = null;
            if (this.experience >= this.needExperience)
            {
                _loc_2 = this.upgradeCount + this.experienceCount;
                if (_loc_2 < 3 && _loc_2 < this.level.levelManager.maxUpgradeIndex)
                {
                    _loc_2++;
                    var _loc_9:String = this;
                    var _loc_10:* = this.experienceCount + 1;
                    _loc_9.experienceCount = _loc_10;
                    this.prevExperience = this.needExperience;
                    if (_loc_2 == 1)
                    {
                        this.needExperience = this.upgr2[7];
                    }
                    else if (_loc_2 == 2)
                    {
                        this.needExperience = this.upgr3_1[7];
                    }
                    else if (_loc_2 == 3)
                    {
                        this.needExperience = this.upgr4_1[7];
                    }
                }
            }
            if (this.upgradeCount + this.experienceCount <= 3)
            {
                _loc_3 = this.needExperience - this.prevExperience;
                _loc_4 = this.experience - this.prevExperience;
                _loc_5 = _loc_4 / _loc_3;
                _loc_6 = 100 * _loc_5;
                this.bar_exp.gotoAndStop(_loc_6);
            }
            this.exp_upgr1.visible = false;
            this.exp_upgr2.visible = false;
            this.exp_upgr3.visible = false;
            var _loc_1:* = !(this.upgradeInd == 4 && this.level.levelManager.upgradeTwo == false);
            if ((this.showUpgrIcons || this.experienceCount > 0 && _loc_1) && !this.isPodval)
            {
                _loc_7 = 1;
                while (_loc_7 <= this.upgradeCount + this.experienceCount)
                {
                    
                    _loc_8 = this["exp_upgr" + _loc_7];
                    _loc_8.visible = true;
                    if (this.experienceCount > 0 && _loc_1)
                    {
                        _loc_8.play();
                    }
                    else if (_loc_8.currentFrame == 1)
                    {
                        _loc_8.stop();
                    }
                    _loc_7++;
                }
                if (this.level.money < this.nextUpgrMinPrice && _loc_1)
                {
                    this.exp_upgr1.gotoAndStop("disabled");
                }
            }
            if (this.experienceCount > 0 && this.level.money >= this.nextUpgrMinPrice)
            {
                HintPanels.cannonReadyUpgrade = true;
            }
            this.exp_upgr2.gotoAndStop(this.exp_upgr1.currentFrame);
            this.exp_upgr3.gotoAndStop(this.exp_upgr1.currentFrame);
            return;
        }// end function

        protected function generateDamage() : void
        {
            this.damage = Utilites.randomInt(this.minDmg, this.maxDmg);
            this.isCrit = this.getIsCrit();
            if (this.isCrit)
            {
                this.damage = this.damage * 2;
            }
            this.damage = this.damage - this.curEnemy.armor;
            if (this.damage < 0)
            {
                this.damage = 0;
            }
            if (this.curEnemy)
            {
                this.curEnemy.preHealth = this.curEnemy.preHealth - this.damage;
            }
            return;
        }// end function

        protected function shoot() : void
        {
            return;
        }// end function

        protected function changeCol() : void
        {
            var _loc_1:int = 0;
            this.prevCol = this.cell.col;
            if (this.state != 2)
            {
                this.state = 3;
            }
            if (this.twr.fr.currentFrame > this.readyShootFrame && this.twr.fr.currentFrame <= this.shootFrame)
            {
                this.twr.fr.gotoAndStop(this.readyShootFrame);
                if (this.curEnemy && this.curEnemy.alive)
                {
                    this.curEnemy.preHealth = this.curEnemy.preHealth + this.damage;
                }
            }
            this.minEnemyX = this.cell.col == 0 ? (-this.distance - Cell.WIDTH * 1.5) : (this.distance + Cell.WIDTH * 1.5);
            if (this.cell.col == 0)
            {
                this.mcCannon.scaleX = -1;
                TweenNano.to(this.mcCannon, 0.3, {x:0});
                this.exp_upgr1.x = 50;
                this.exp_upgr2.x = 50;
                this.exp_upgr3.x = 50;
                this.reload_arrow.x = 50;
            }
            else if (this.cell.col == 2)
            {
                this.mcCannon.scaleX = 1;
                TweenNano.to(this.mcCannon, 0.3, {x:Cell.WIDTH});
                this.exp_upgr1.x = 10;
                this.exp_upgr2.x = 10;
                this.exp_upgr3.x = 10;
                this.reload_arrow.x = 10;
            }
            else
            {
                this.curEnemy = null;
                _loc_1 = this.xOffsets[this.upgradeInd];
                if (this.mcCannon.scaleX == 1)
                {
                    _loc_1 = Cell.WIDTH - _loc_1;
                }
                TweenNano.to(this.mcCannon, 0.3, {x:_loc_1});
            }
            return;
        }// end function

        public function fire() : void
        {
            this.twr.fr.play();
            return;
        }// end function

        public function stopFire() : void
        {
            this.twr.fr.gotoAndStop(1);
            return;
        }// end function

        public function dispose() : void
        {
            removeEventListener(MouseEvent.MOUSE_OVER, this.showStateInfo);
            removeEventListener(MouseEvent.MOUSE_OUT, this.hideStateInfo);
            this.cell = null;
            this.twr = null;
            this.animDir = null;
            this.modifers = null;
            this.level = null;
            if (parent)
            {
                parent.removeChild(this);
            }
            removeChild(this.mcCannon);
            this.mcCannon = null;
            this.isPodval = false;
            return;
        }// end function

    }
}
