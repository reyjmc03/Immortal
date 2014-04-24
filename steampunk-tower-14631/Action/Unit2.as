package 
{
    import Enemy.*;
    import Unit2.*;
    import flash.geom.*;

    public class Unit2 extends Enemy
    {
        private static var changeDie1:Boolean = false;
        private static var changeDie2:Boolean = false;
        private static var changeDie3:Boolean = false;
        private static var changeDie4:Boolean = false;

        public function Unit2()
        {
            health = 50;
            minDamage = 3;
            maxDamage = 5;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Steam Soldier";
            armor = 2;
            money = 1000;
            modifers.lightAdd = 20;
            modifers.sawAdd = 10;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 10));
            mcName = "Unit2Mc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 17;
            aim1 = 18;
            aim2 = 34;
            shoot1 = 35;
            shoot2 = 42;
            shootFrame = shoot1 + 3;
            die1 = 43;
            die2 = 97;
            healthY = -20;
            healthW = 25;
            speed = -0.8 * scaleX;
            y = param1.getUnitY(side);
            line = 1;
            stopX = Utilites.randomNumber(116, 150) * scaleX;
            fireEffect = "FireUnit2";
            shockEffect = "ShockUnit2";
            selectRct = new Rectangle(-2.4, 12.35, 28.85, 7.4);
            return;
        }// end function

        override protected function createDieEffect() : void
        {
            return;
        }// end function

        override protected function die(param1:Bullet = null) : void
        {
            var _loc_2:Number = NaN;
            if (!alive)
            {
                return;
            }
            if (!param1 || param1.cannon is CannonMachineGun || param1.cannon is CannonElectroGun)
            {
                changeDie1 = this.calcChange(changeDie1);
                if (changeDie1)
                {
                    die1 = 43;
                    die2 = 97;
                }
                else
                {
                    die1 = 98;
                    die2 = 163;
                }
            }
            else if (param1.cannon is CannonSawGun)
            {
                changeDie2 = this.calcChange(changeDie2);
                if (changeDie2 && state == 0)
                {
                    die1 = 164;
                    die2 = 219;
                }
                else
                {
                    die1 = 220;
                    die2 = 276;
                }
            }
            else if (param1.cannon is CannonHeavyGun || param1 is BulletEye)
            {
                _loc_2 = param1 is BulletEye ? (level.mouseX) : (param1.mc.x);
                if (side == "right" && _loc_2 > levelX || side == "left" && _loc_2 < levelX)
                {
                    changeDie3 = this.calcChange(changeDie3);
                    if (changeDie3)
                    {
                        die1 = 337;
                        die2 = 396;
                    }
                    else
                    {
                        die1 = 456;
                        die2 = 512;
                    }
                }
                else
                {
                    changeDie4 = this.calcChange(changeDie4);
                    if (changeDie4)
                    {
                        die1 = 277;
                        die2 = 336;
                    }
                    else
                    {
                        die1 = 397;
                        die2 = 455;
                    }
                }
            }
            super.die(param1);
            return;
        }// end function

        private function calcChange(param1:Boolean) : Boolean
        {
            if (Math.random() > 0.8)
            {
                return param1;
            }
            return !param1;
        }// end function

    }
}
