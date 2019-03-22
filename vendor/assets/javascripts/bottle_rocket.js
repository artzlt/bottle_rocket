$(document).ready(function() {
    $('.countdown').each(function(){
        var start   = new Date().getTime();
        var elapsed = 0;

        var me                       = $(this);
        var direction                = me.data('direction');
        var steps                    = set_steps(me);
        var interval                 = set_interval(steps);
        var interval_unit_container  = me.find('.'+steps);

        var update = function() {
            var cur_unit_container = interval_unit_container;
            var cycle_empty = true
            do {
                cur_unit_container = cur_unit_container.prev();
                cycle_empty = !(amount_for(cur_unit_container) > 0);
            } while(cycle_empty && cur_unit_container.attr("class") != "days");

            cur_unit_container = interval_unit_container;
            do {
                var amount = amount_for(cur_unit_container);
                var max_amount = cur_unit_container.data('max-amount');
                var container_class = cur_unit_container.attr("class");
                var escalate = false;
                if (direction == 'up') {
                    if (max_amount === undefined || amount < max_amount) {
                        amount++;
                    } else {
                        amount = 0;
                        escalate = true;
                    }
                } else {
                    if (amount > 0) {
                        amount--;
                    } else {
                        if (!(max_amount === undefined || cycle_empty)) {
                            amount = max_amount;
                            escalate = true;
                        }
                    }
                }
                update_amount_containers(cur_unit_container, amount);
                cur_unit_container = cur_unit_container.prev();
            } while (escalate && container_class != "days");

            elapsed += interval;
            var diff = (new Date().getTime() - start) - elapsed;
            setTimeout(update, (interval - diff));
        }
        setTimeout(update, interval);
    });

})

var set_steps = function(parent) {
    var steps = parent.data('steps');
    return steps;
}

var set_interval = function(steps) {
    switch (steps) {
        case "seconds": return 1000;
        case "minutes": return 60000;
    }
}

var amount_for = function(container) {
    return parseInt(container.data('amount'));
}

var update_amount_containers = function(parent, amount) {
    parent.find('.amount').remove();

    $(amount.toString().split('')).each(function(){
        var t_amount = parseInt(this);
        var html   = "<span class=\"amount amount-" + t_amount + "\">" + t_amount + "</span>"
        parent.children().last().before($(html));
    });
    parent.data('amount', amount);
}
;
