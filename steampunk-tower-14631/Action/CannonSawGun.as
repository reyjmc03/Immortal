package 
{
    import Cannon.*;
    import CannonSawGun.*;
    import flash.geom.*;

    public class CannonSawGun extends Cannon
    {
        private static var _price:int = 9000;

        public function CannonSawGun()
        {
            return;
        }// end function

        override public function get bullets() : int
        {
            return _bullets + Upgrades.saws.bullets;
        }// end function

        override public function get speed() : Number
        {
            return _speed + Upgrades.saws.speed * _speed;
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

        override public function getIsCrit() : Boolean
        {
            return Math.random() < Upgrades.saws.critical + modifers.critical;
        }// end function

        override public function initializeData() : void
        {
            upgr1 = [100, 9000, "12-19", 2500, 25, 10000, 240, 150];
            upgr2 = [100, 13000, "28-38", 2400, 30, 10000, 250, 500];
            upgr3_1 = [100, 22000, "50-67", 2200, 40, 10000, 250, 1800];
            upgr4_1 = [100, 30000, "68-80", 2000, 45, 10000, 250, 4000];
            upgr3_2 = [100, 25000, "62-78", 2400, 45, 10000, 250, 2000];
            upgr4_2 = [100, 33000, "75-110", 2300, 45, 10000, 260, 4000];
            modifers1 = {critical:0.05};
            modifers2 = {critical:0.08};
            modifers3_1 = {critical:0.1};
            modifers4_1 = {critical:0.13};
            modifers3_2 = {critical:0.2};
            modifers4_2 = {critical:0.3};
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            type = 3;
            mcCannon = new SawGun();
            xOffsets = [27, 30, 30, 30, 30, 30];
            shootFrame = 38;
            readyShootFrame = shootFrame - 4;
            rotationSpeed = 7;
            deafultBulletPoints = [new Point(34.8, -9), new Point(35.1, -8.6), new Point(43.2, -3.6), new Point(40.5, -4.9), new Point(29.3, -12.5), new Point(31.2, -12.7)];
            super.initialize(param1);
            totalMoney = price;
            return;
        }// end function

        override protected function shoot() : void
        {
            var _loc_1:* = new BulletSawGun1();
            if (upgradeInd == 4 || upgradeInd == 5)
            {
                _loc_1.type = 2;
            }
            var _loc_2:* = getBulletPos();
            var _loc_3:* = getBulletPos2();
            var _loc_4:* = _loc_2.subtract(_loc_3);
            _loc_1.velocity = _loc_4;
            _loc_1.initialize(curEnemy, this, _loc_2, getDamage(), isCrit, true);
            this.playShootSound();
            return;
        }// end function

        private function playShootSound() : void
        {
            var _loc_1:String = "";
            var _loc_2:Number = 0.3;
            var _loc_3:int = 0;
            if (upgradeInd == 0 || upgradeInd == 1 || upgradeInd == 2 || upgradeInd == 3)
            {
                _loc_3 = Utilites.randomInt(1, 2);
                if (_loc_3 == 1)
                {
                    _loc_1 = "snd_saw1_shoot1";
                }
                if (_loc_3 == 2)
                {
                    _loc_1 = "snd_saw1_shoot2";
                }
            }
            if (upgradeInd == 4 || upgradeInd == 5)
            {
                _loc_1 = "snd_saw1_shoot3";
            }
            SoundManager.playOnce(_loc_1, _loc_2);
            return;
        }// end function

        public static function get price() : int
        {
            var _loc_1:* = _price + _price * Upgrades.saws.price;
            return _loc_1;
        }// end function

    }
}
