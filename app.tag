<app>
    <div class="pure-g">
        <!-- <div onclick="{buttonclick}"class="button-xlarge pure-button pure-u-1-4">Сбросить</div>
        <div onclick="{buttonclick}"class="button-xlarge pure-button pure-u-1-4">Сбросить</div>
        <div onclick="{buttonclick}"class="button-xlarge pure-button pure-u-1-4">Сбросить</div>
        <div onclick="{buttonclick}"class="button-xlarge pure-button pure-u-1-4">Сбросить</div> -->

        <div class="result pure-u-1">
            <p>Время начала: {date.getHours()}:{date.getMinutes()}</p>
            <p if={buttons_type == 'hour'}>Число минут: {Math.round(((new Date()).getTime() - date.getTime())/60000)} </p>
            <p if={buttons_type == 'hour'}>Ce: {Math.round(((new Date()).getTime() - date.getTime())/60000)} </p>
        </div>

        <div
            each="{buttons}"
            onclick="{buttonclick}"
            class="button-xlarge pure-button pure-u-1-3"
        ><p>{text}</p></div>
    </div>


    <script type="text/javascript">
        var self = this
        self.date = new Date();
        self.buttons_type = 'hour'
        self.hour = [
            {type: 'h', text: '0'}, {type: 'h', text: '11'}, {type: 'h', text: '12'},
            {type: 'h', text: '13'}, {type: 'h', text: '14'}, {type: 'h', text: '15'},
            {type: 'h', text: '16'}, {type: 'h', text: '17'}, {type: 'h', text: '18'},
            {type: 'h', text: '19'}, {type: 'h', text: '20'}, {type: 'h', text: '21'},
            {type: 'h', text: '22'}, {type: 'h', text: '23'},
        ]
        self.decad = [
            {type: 'd', text: '00'}, {type: 'd', text: '10'}, {type: 'd', text: '20'},
            {type: 'd', text: '30'}, {type: 'd', text: '40'}, {type: 'd', text: '50'},
        ]
        self.minut = [
            {type: 'm', text: '0'}, {type: 'm', text: '1'}, {type: 'm', text: '2'},
            {type: 'm', text: '3'}, {type: 'm', text: '4'}, {type: 'm', text: '5'},
            {type: 'm', text: '6'}, {type: 'm', text: '7'}, {type: 'm', text: '8'},
            {type: 'm', text: '9'},
        ]

        self.buttons = []
        self.on('mount', function () {
            self.buttons = self.hour

            self.update()
        })

        self.on('update', function () {
            console.log(self.buttons_type)
            self.buttons = this[self.buttons_type]
        })

        self.buttonclick = function (e) {
            var item = e.item
            if (item.type == 'h') {
                self.buttons_type = 'decad'
                self.date.setHours(item.text)
            } else if (item.type == 'd') {
                self.buttons_type = 'minut'
                self.date.setMinutes(item.text)
            } else if (item.type == 'm') {
                self.buttons_type = 'hour'
                var minutes = self.date.getMinutes()
                minutes = minutes + parseInt(item.text, 10)
                self.date.setMinutes(minutes)
            }

            self.update()
        }


    </script>
</app>
