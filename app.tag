<app class="wrap">

    <div class="pure-g row">
        <div class=" pure-u-1-3">
            {now.format('HH:mm')} -
            <span class="num {active: current==0}">{nums[0]}</span><span class="num {active: current==1}">{nums[1]}</span>:<span class="num {active: current==2}">{nums[2]}</span><span class="num {active: current==3}">{nums[3]}</span>
        </div>

        <div if={current == 0 && !deleted} class="row pure-u-1-3"><span>= {format_delta()}</span></div>

        <div if={current == 0 && !deleted} class="row pure-u-1-3"><span>= {money} руб.</span></div>
    </div>

    <div class="pure-g">



        <div each={buttons} onclick="{click}" class="calc-button pure-button button-xlarge pure-u-1-3">{val}</div>
    </div>


    <script type="text/javascript">
        var self = this
        self.now = moment();
        self.current = 0;
        self.delta = 0;
        self.money = 0;
        self.deleted = true;
        self.nums = [0, 0, 0, 0];

        self.buttons = [
            {func: 'num', val: '1',},
            {func: 'num', val: '2',},
            {func: 'num', val: '3',},
            {func: 'num', val: '4',},
            {func: 'num', val: '5',},
            {func: 'num', val: '6',},
            {func: 'num', val: '7',},
            {func: 'num', val: '8',},
            {func: 'num', val: '9',},
            {func: 'deleteAll', val: 'сброс',},
            {func: 'num', val: '0',},
            {func: 'deleteAll', val: 'сброс',}
        ]

        self.compileDate = function () {
            self.date = moment().hour(self.nums[0] + self.nums[1]).minute(self.nums[2] + self.nums[3])
            self.delta = moment.duration(moment().subtract(self.date)).asMinutes()

            self.update()
        }

        self.format_delta = function() {
            var lowcost
            if (self.delta > 4*60) {
                self.money = 540
                return parseFloat(self.delta/60).toFixed(1) + ' часов'
            } else if (self.delta <= 60) {
                self.money = self.delta * 3
                return self.delta + '*3'
            } else if (self.delta > 60) {
                lowcost = self.delta-60
                self.money = 60*3 + lowcost*2
                return '60*3 + '+ lowcost +'*2'
            }
            self.money = parseInt(self.money, 10)
            self.update()
        }

        self.click = function (e) {
            self[e.item.func](e)
        }

        self.num = function (e) {
            self.deleted = false
            self.nums[self.current] = e.item.val
            if (self.current >= 3) {
                self.compileDate()
                self.current = 0
            } else {
                self.current = self.current + 1
            }
            self.update()
        }

        self.deleteAll = function (e) {
            self.deleted = true
            self.current = 0
            self.nums = [0, 0, 0, 0];
            self.update()
        }

    </script>
</app>
