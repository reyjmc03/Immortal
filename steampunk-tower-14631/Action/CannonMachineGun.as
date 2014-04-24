package 
{
    import Cannon.*;
    import CannonMachineGun.*;
    import flash.geom.*;

    public class CannonMachineGun extends Cannon
    {
        private var bulletPos1:Point;
        private var bulletPos2:Point;
        public static var price:int = 7000;

        public function CannonMachineGun()
        {
            this.bulletPos1 = new Point(25.75, -0.1);
            this.bulletPos2 = new Point(23.9, 0.25);
            return;
        }// end function

        override public function get distance() : Number
        {
            return _distance + Upgrades.machineGun.dist;
        }// end function

        override public function get speed() : Number
        {
            return _speed + Upgrades.machineGun.speed * _speed;
        }// end function

        override public function getIsCrit() : Boolean
        {
            return Math.random() < Upgrades.machineGun.critical + modifers.critical;
        }// end function

        override protected function generateDamage() : void
        {
            damage = Utilites.randomInt(minDmg, maxDmg);
            damage = damage + Math.ceil(damage * Upgrades.machineGun.damage);
            isCrit = this.getIsCrit();
            if (isCrit)
            {
                damage = damage * 2;
            }
            damage = damage - curEnemy.armor;
            if (damage < 0)
            {
                damage = 0;
            }
            if (curEnemy)
            {
                curEnemy.preHealth = curEnemy.preHealth - damage;
            }
            return;
        }// end function

        override public function getBulletPos() : Point
        {
            if ((upgradeInd == 2 || upgradeInd == 3) && mcCannon.turr.twr.fr.currentFrame == 3)
            {
                if (upgradeInd == 2)
                {
                    return mcCannon.turr.twr.localToGlobal(this.bulletPos1);
                }
                if (upgradeInd == 3)
                {
                    return mcCannon.turr.twr.localToGlobal(this.bulletPos2);
                }
            }
            return super.getBulletPos();
        }// end function

        override protected function getBulletPos2() : Point
        {
            if ((upgradeInd == 2 || upgradeInd == 3) && mcCannon.turr.twr.fr.currentFrame == 3)
            {
                if (upgradeInd == 2)
                {
                    _bulletPos2.x = this.bulletPos1.x - 20;
                    _bulletPos2.y = this.bulletPos1.y;
                }
                else if (upgradeInd == 3)
                {
                    _bulletPos2.x = this.bulletPos2.x - 20;
                    _bulletPos2.y = this.bulletPos2.y;
                }
                return mcCannon.turr.twr.localToGlobal(_bulletPos2);
            }
            _bulletPos2.x = _bulletPos.x - 20;
            _bulletPos2.y = _bulletPos.y;
            return super.getBulletPos2();
        }// end function

        override public function setUpgrade(param1:int) : void
        {
            super.setUpgrade(param1);
            if (upgradeInd == 2 || upgradeInd == 3)
            {
                shootFrame = 5;
            }
            else
            {
                shootFrame = 3;
            }
            return;
        }// end function

        override public function initializeData() : void
        {
            upgr1 = [100, 7000, "4-7", 700, 60, 10000, 190, 145];
            upgr2 = [100, 11000, "7-11", 650, 70, 10000, 200, 500];
            upgr3_1 = [100, 22000, "8-13", 400, 70, 10000, 210, 2000];
            upgr4_1 = [100, 30000, "15-20", 300, 70, 10000, 210, 4000];
            upgr3_2 = [100, 20000, "15-20", 600, 80, 10000, 230, 2000];
            upgr4_2 = [100, 28000, "25-30", 500, 90, 10000, 240, 4000];
            modifers1 = {critical:0, fireUp:0.02};
            modifers2 = {critical:0, fireUp:0.03};
            modifers3_1 = {critical:0.03, fireUp:0.03};
            modifers4_1 = {critical:0.05, fireUp:0.05};
            modifers3_2 = {critical:0, fireUp:0.25};
            modifers4_2 = {critical:0, fireUp:0.3};
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            type = 1;
            mcCannon = new MachineGun();
            xOffsets = [21, 27, 22, 15, 25, 25];
            deafultBulletPoints = [new Point(26.7, -2.6), new Point(30.1, -2.6), new Point(25.75, -5), new Point(23.9, -5), new Point(34.5, -3.3), new Point(35.2, -3.25)];
            super.initialize(param1);
            totalMoney = price;
            return;
        }// end function

        override public function update() : void
        {
            var _loc_1:BulletMachineGun = null;
            var _loc_2:Point = null;
            var _loc_3:Point = null;
            var _loc_4:Point = null;
            super.update();
            if (upgradeInd == 2 || upgradeInd == 3)
            {
                if (state == 0 && mcCannon.turr.twr.fr.currentFrame == 3 && curEnemy)
                {
                    _loc_1 = new BulletMachineGun();
                    _loc_1.isDummy = true;
                    _loc_2 = this.getBulletPos();
                    _loc_3 = this.getBulletPos2();
                    _loc_4 = _loc_2.subtract(_loc_3);
                    _loc_1.velocity = _loc_4;
                    _loc_1.initialize(curEnemy, this, _loc_2, 0, false, false);
                }
            }
            return;
        }// end function

        override protected function shoot() : void
        {
            var _loc_1:BulletMachineGun = null;
            var _loc_2:Point = null;
            var _loc_3:Point = null;
            var _loc_4:Point = null;
            if (curEnemy)
            {
                _loc_1 = new BulletMachineGun();
                _loc_2 = this.getBulletPos();
                _loc_3 = this.getBulletPos2();
                _loc_4 = _loc_2.subtract(_loc_3);
                _loc_1.velocity = _loc_4;
                _loc_1.initialize(curEnemy, this, _loc_2, getDamage(), isCrit, true);
                this.playShootSound();
            }
            return;
        }// end function

        private function playShootSound() : void
        {
            var _loc_1:String = "";
            var _loc_2:Number = 0.3;
            var _loc_3:int = 0;
            if (upgradeInd == 0 || upgradeInd == 1 || upgradeInd == 4 || upgradeInd == 5)
            {
                _loc_3 = Utilites.randomInt(1, 3);
                if (_loc_3 == 1)
                {
                    _loc_1 = "snd_machinegun_shoot_1";
                }
                if (_loc_3 == 2)
                {
                    _loc_1 = "snd_machinegun_shoot_2";
                }
                if (_loc_3 == 3)
                {
                    _loc_1 = "snd_machinegun_shoot_3";
                }
            }
            if (upgradeInd == 2 || upgradeInd == 3)
            {
                _loc_3 = Utilites.randomInt(1, 2);
                if (_loc_3 == 1)
                {
                    _loc_1 = "snd_machinegun2_shoot_1";
                }
                if (_loc_3 == 2)
                {
                    _loc_1 = "snd_machinegun2_shoot_2";
                }
            }
            SoundManager.playOnce(_loc_1, _loc_2);
            return;
        }// end function

    }
}
