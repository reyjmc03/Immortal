package steampunk_tower_fla
{
    import flash.display.*;

    dynamic public class towerbodycontainer_80 extends MovieClip
    {
        public var floor3:MovieClip;
        public var floor4:MovieClip;
        public var floor5:MovieClip;
        public var left_1:MovieClip;
        public var left_2:MovieClip;
        public var left_3:MovieClip;
        public var left_4:MovieClip;
        public var right_1:MovieClip;
        public var head:MovieClip;
        public var left_5:MovieClip;
        public var right_2:MovieClip;
        public var right_3:MovieClip;
        public var right_4:MovieClip;
        public var right_5:MovieClip;
        public var floor1:MovieClip;
        public var floor2:MovieClip;

        public function towerbodycontainer_80()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 25, this.frame26, 26, this.frame27, 50, this.frame51, 51, this.frame52, 75, this.frame76, 76, this.frame77, 99, this.frame100);
            return;
        }// end function

        function frame1()
        {
            stop();
            this.left_4.stop();
            this.right_4.stop();
            this.left_5.play();
            this.right_5.play();
            this.floor2.visible = false;
            this.floor3.visible = false;
            this.floor4.visible = false;
            this.floor5.visible = false;
            return;
        }// end function

        function frame2()
        {
            this.floor2.visible = true;
            return;
        }// end function

        function frame26()
        {
            stop();
            this.left_3.gotoAndStop(1);
            this.right_3.gotoAndStop(1);
            this.left_4.play();
            this.right_4.play();
            this.left_5.play();
            this.right_5.play();
            this.floor3.visible = false;
            this.floor4.visible = false;
            this.floor5.visible = false;
            return;
        }// end function

        function frame27()
        {
            this.floor3.visible = true;
            return;
        }// end function

        function frame51()
        {
            stop();
            this.left_2.gotoAndStop(1);
            this.right_2.gotoAndStop(1);
            this.left_3.play();
            this.right_3.play();
            this.floor4.visible = false;
            this.floor5.visible = false;
            return;
        }// end function

        function frame52()
        {
            this.floor4.visible = true;
            return;
        }// end function

        function frame76()
        {
            stop();
            this.left_1.gotoAndStop(1);
            this.right_1.gotoAndStop(1);
            this.left_2.play();
            this.right_2.play();
            if (this.left_3.currentFrame == 1)
            {
                this.left_3.play();
            }
            if (this.right_3.currentFrame == 1)
            {
                this.right_3.play();
            }
            this.floor5.visible = false;
            return;
        }// end function

        function frame77()
        {
            this.floor5.visible = true;
            return;
        }// end function

        function frame100()
        {
            stop();
            this.left_1.play();
            this.right_1.play();
            if (this.left_3.currentFrame == 1)
            {
                this.left_3.play();
            }
            if (this.right_3.currentFrame == 1)
            {
                this.right_3.play();
            }
            return;
        }// end function

    }
}
