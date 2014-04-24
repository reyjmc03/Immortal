package 
{
    import Enemy.*;
    import Tank3.*;
    import flash.geom.*;

    public class Tank3 extends Enemy
    {

        public function Tank3()
        {
            health = 900;
            minDamage = 20;
            maxDamage = 40;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Grand Tank";
            armor = 6;
            money = 7000;
            modifers.gunIgnore = 30;
            modifers.lightIgnore = 20;
            modifers.heavyAdd = 20;
            modifers.sawAdd = 10;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 28));
            mcName = "Tank3Mc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 20;
            shoot1 = 21;
            shoot2 = 30;
            shootFrame = shoot1 + 3;
            die1 = 31;
            die2 = mcEnemy.totalFrames;
            healthY = -40;
            healthW = 75;
            speed = -0.5 * scaleX;
            y = Utilites.randomNumber(180, 210);
            line = 1;
            stopX = Utilites.randomInt(140, 160) * scaleX;
            fireEffect = "FireTankBig";
            shockEffect = "ShockTankBig";
            selectRct = new Rectangle(-2.2, 26.85, 106.1, 18.9);
            return;
        }// end function

        override protected function die(param1:Bullet = null) : void
        {
            if (alive)
            {
                super.die(param1);
                level.shake(1, 500);
            }
            return;
        }// end function

    }
}
