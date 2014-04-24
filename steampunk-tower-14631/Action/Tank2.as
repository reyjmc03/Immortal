package 
{
    import Enemy.*;
    import Tank2.*;
    import flash.geom.*;

    public class Tank2 extends Enemy
    {

        public function Tank2()
        {
            health = 300;
            minDamage = 16;
            maxDamage = 22;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Armored Tank";
            armor = 4;
            money = 3000;
            modifers.gunIgnore = 20;
            modifers.heavyAdd = 20;
            modifers.sawAdd = 10;
            collideRadiuses.push(new CollideRadius(this, -14, 4, 12));
            collideRadiuses.push(new CollideRadius(this, 11, 0, 18));
            mcName = "Tank2Mc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 10;
            shoot1 = 11;
            shoot2 = 18;
            shootFrame = shoot1 + 3;
            die1 = 19;
            die2 = mcEnemy.totalFrames;
            healthY = -30;
            healthW = 50;
            speed = -0.75 * scaleX;
            y = Utilites.randomNumber(180, 220);
            line = 1;
            stopX = Utilites.randomInt(140, 160) * scaleX;
            fireEffect = "FireTank2";
            shockEffect = "ShockTank2";
            selectRct = new Rectangle(-0.45, 14.9, 70.25, 13.25);
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
