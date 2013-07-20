$(document).ready(function() {
    $('.countdown').each(function(){
        var start   = new Date().getTime();
        var elapsed = 0;

        var me                       = $(this);
        var direction                = me.data('direction');
        var steps                    = set_steps(me);
        var interval                 = set_interval(steps);
        var interval_unit_container  = me.find('.'+steps);
        var preceding_unit_container = interval_unit_container.prev();
        var total_amount             = parseInt(interval_unit_container.data('amount'));
        var max_amount               = 59;

        var update = function() {
            if (direction == 'up') {
                var new_amount = ++total_amount;
                if (total_amount == max_amount) { total_amount = -1 }
            } else {
                var new_amount = --total_amount;
                if (new_amount == -1) { total_amount = max_amount }
            }

            update_amount_containers(interval_unit_container, new_amount);

            //TODO: handle countup update on preceding unit
            if (new_amount == -1 && preceding_unit_container) {
                var preceding_amount = parseInt(preceding_unit_container.data('amount'));
                preceding_amount = direction == 'up' ? ++preceding_amount : --preceding_amount;

                update_amount_containers(preceding_unit_container, preceding_amount);
            }

            elapsed += interval;
            var diff = (new Date().getTime() - start) - elapsed;
            setTimeout(update, (interval - diff));
        }
        setTimeout(update, interval);
    });

})

var set_steps = function(parent) {
    var steps = parent.data('steps');
    if (parent.find('.'+steps).size() > 0) {
        return steps;
    }
    else {
        return parent.children().last().attr('class');
    }
}

var set_interval = function(steps) {
    switch (steps) {
        case "seconds": return 1000;
        case "minutes": return 60000;
    }
}

var update_amount_containers = function(parent, amount) {
    //TODO: fix negative amount (splitting of ['-', '1'])
    parent.find('.amount').remove();

    $(amount.toString().split('')).each(function(){
        var amount = parseInt(this);
        var html   = "<span class=\"amount amount-" + amount + "\">" + amount + "</span>"

        parent.children().last().before($(html));
    });
    parent.data('amount', amount);
}