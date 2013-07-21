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
        var amount                   = amount_for(interval_unit_container);
        var max_amount               = interval_unit_container.data('max-amount');

        var update = function() {
            var preceding_amount = amount_for(preceding_unit_container);

            if (direction == 'up') {
                amount < max_amount ? amount++ : amount = 0;
                update_amount_containers(interval_unit_container, amount);

                if (amount == 0 && preceding_unit_container.size() > 0) {
                    preceding_amount++;
                    update_amount_containers(preceding_unit_container, preceding_amount);
                }
            } else { // direction is 'down'
                amount > 0 ? amount-- : amount = max_amount;
                update_amount_containers(interval_unit_container, amount);

                if (amount == max_amount && preceding_unit_container.size() > 0) {
                    preceding_amount--;
                    update_amount_containers(preceding_unit_container, preceding_amount);
                }
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

var amount_for = function(container) {
    return parseInt(container.data('amount'));
}

var update_amount_containers = function(parent, amount) {
    parent.find('.amount').remove();

    $(amount.toString().split('')).each(function(){
        var amount = parseInt(this);
        var html   = "<span class=\"amount amount-" + amount + "\">" + amount + "</span>"

        parent.children().last().before($(html));
    });
    parent.data('amount', amount);
}