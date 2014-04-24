package 
{
    import Enemy.*;
    import Tank1.*;
    import flash.geom.*;

    public class Tank1 extends Enemy
    {

        public function Tank1()
        {
            health = 250;
            minDamage = 18;
            maxDamage = 24;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Tank";
            armor = 3;
            money = 2500;
            modifers.heavyAdd = 20;
            modifers.sawAdd = 20;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 17));
            mcName = "Tank1Mc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 10;
            shoot1 = 11;
            shoot2 = 18;
            shootFrame = shoot1 + 3;
            die1 = 19;
            die2 = mcEnemy.totalFrames;
            healthY = -20;
            healthW = 50;
            speed = -1 * scaleX;
            y = Utilites.randomInt(170, 210);
            line = 1;
            stopX = Utilites.randomInt(140, 160) * scaleX;
            fireEffect = "FireTank";
            shockEffect = "ShockTank";
            selectRct = new Rectangle(-2.3, 14.45, 64.85, 11.55);
            return;
        }// end function

        override protected function die(param1:Bullet = null) : void
        {
            if (alive)
            {
                level.shake(0.5, 200);
                super.die(param1);
            }
            return;
        }// end function

    }
}
