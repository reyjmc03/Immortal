package 
{
    import Enemy.*;
    import Wheel.*;
    import flash.geom.*;

    public class Wheel extends Enemy
    {

        public function Wheel()
        {
            health = 20;
            minDamage = 10;
            maxDamage = 15;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Monocycle";
            armor = 0;
            money = 800;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 17));
            mcName = "WheelMc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 12;
            die1 = 13;
            die2 = mcEnemy.totalFrames;
            healthY = -20;
            healthW = 35;
            stopX = 70 * scaleX;
            line = 1;
            speed = -2.5 * scaleX;
            y = Utilites.randomNumber(220, 225);
            fireEffect = "FireWheel";
            shockEffect = "ShockWheel";
            selectRct = new Rectangle(0.05, 16.55, 35.55, 7.4);
            return;
        }// end function

        override public function update() : void
        {
            var _loc_1:Number = NaN;
            super.update();
            if (alive)
            {
                _loc_1 = x + forwardOffset * scaleX;
                if (side == "left" && _loc_1 >= stopX || side == "right" && _loc_1 < stopX)
                {
                    alive = false;
                    state = 4;
                    mcEnemy.gotoAndPlay(die1);
                    level.health = level.health - damage;
                    level.shake(0.5, 200);
                }
            }
            return;
        }// end function

        override protected function createDieEffect() : void
        {
            return;
        }// end function

    }
}
