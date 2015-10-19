<app class="wrap">
    <div class="pure-g">
        <div class=" pure-u-1-3">
            Cейчас: {moment().format('HH:mm')}
        </div>

    </div>
    <div class="pure-g">
        <div class="pure-u-1-3">
            <input type="time" name="timeInput" onchange="{changeTime}">
        </div>
        <div class="pure-u-1-3" >
            = {minutes}
        </div>
        <div class="pure-u-1-3">
            = {calcMoney()} руб.
        </div>
    </div>


    <script type="text/javascript">
        var self = this
        self.time = moment()
        self.minutes = ''
        self.delta = 0

        self.on('mount', function () {
            self.timeInput.value = self.time.format('HH:mm')
            setInterval(self.update, 10000)
        })

        self.on('update', function () {
            console.log(self.delta)
            self.calcDelta()
            self.formatDelta()
            // self.calcMoney()
            // console.log(self.delta)
        })

        self.changeTime = function (e) {
            self.time = moment(e.target.value, 'HH:mm')
            self.update()
        }

        self.calcDelta = function () {
            var minutes = moment.duration(moment().subtract(self.time)).asMinutes()
            self.delta = Math.floor(minutes)
        }

        self.formatDelta = function () {
            if (self.delta > 4*60) {
                self.minutes = parseFloat(self.delta/60).toFixed(1) + ' часов'
            } else if (self.delta > 60) {
                self.minutes = '60*3 + '+ (self.delta-60) +'*2'
            } else if (self.delta) {
                self.minutes = self.delta + '*3'
            } else {
                self.minutes = 'время не задано'
            }
        }

        self.calcMoney = function () {
            if (self.delta > 4*60) {
                return 540
            } else if (self.delta <= 60) {
                return self.delta * 3
            } else if (self.delta > 60) {
                return (self.delta-60)*2 + 60*3
            }

        }

    </script>
</app>
