package 
{
    import Enemy.*;
    import Unit1.*;
    import flash.geom.*;

    public class Unit1 extends Enemy
    {
        private static var changeDie1:Boolean = false;
        private static var changeDie2:Boolean = false;
        private static var changeDie3:Boolean = false;
        private static var changeDie4:Boolean = false;

        public function Unit1()
        {
            health = 10;
            minDamage = 1;
            maxDamage = 4;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Soldier";
            armor = 0;
            money = 300;
            modifers.lightAdd = 20;
            collideRadiuses.push(new CollideRadius(this, 3, -2, 8));
            mcName = "Unit1Mc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 11;
            aim1 = 12;
            aim2 = 17;
            shoot1 = 18;
            shoot2 = 25;
            shootFrame = shoot1 + 3;
            die1 = 26;
            die2 = 81;
            healthY = -20;
            healthW = 25;
            speed = -1.8 * scaleX;
            y = param1.getUnitY(side);
            line = 1;
            stopX = Utilites.randomNumber(116, 150) * scaleX;
            fireEffect = "FireUnit1";
            shockEffect = "ShockUnit1";
            selectRct = new Rectangle(0, 10, 28.9, 7.4);
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
                    die1 = 26;
                    die2 = 81;
                }
                else
                {
                    die1 = 82;
                    die2 = 140;
                }
            }
            else if (param1.cannon is CannonSawGun)
            {
                changeDie2 = this.calcChange(changeDie2);
                if (changeDie2 && state == 0)
                {
                    die1 = 141;
                    die2 = 202;
                }
                else
                {
                    die1 = 203;
                    die2 = 259;
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
                        die1 = 319;
                        die2 = 377;
                    }
                    else
                    {
                        die1 = 438;
                        die2 = 497;
                    }
                }
                else
                {
                    changeDie4 = this.calcChange(changeDie4);
                    if (changeDie4)
                    {
                        die1 = 260;
                        die2 = 318;
                    }
                    else
                    {
                        die1 = 378;
                        die2 = 437;
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
