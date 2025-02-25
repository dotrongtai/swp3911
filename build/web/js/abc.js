menuBar.append($this.mobileNav);

// Iterate over structure adding additional structure
var items = $this.mobileNav.find('li');

$(items).each(function () {
    var item = $(this),
        data = {};

    // Find children ul elements and set their role to 'menu'
    data.children = item.children('ul').attr('role', 'menu');
    item.data('menu', data);

    // If a list item has a nested menu
    if (data.children.length > 0) {
        handleNestedMenu(item, data);
    } else if (item.children().length === 0) {
        item.addClass(prefix + '_txtnode');
    }

    // Accessibility for links
    item.children('a').attr('role', 'menuitem').click(function (event) {
        // Ensure that it's not a parent
        if (settings.closeOnClick && !$(event.target).parent().closest('li').hasClass(prefix + '_parent')) {
            // Emulate menu close if set
            $($this.btn).click();
        }
    });

    // Also close on click if parent links are set
    if (settings.closeOnClick && settings.allowParentLinks) {
        item.children('a').children('a').click(function (event) {
            // Emulate menu close
            $($this.btn).click();
        });
    }
});

function handleNestedMenu(item, data) {
    // Select all text before the child menu
    var a = item.contents();

    // Create a wrap element with appropriate attributes
    var wrapElement = $('<' + settings.parentTag + ' role="menuitem" aria-haspopup="true" tabindex="-1" class="' + prefix + '_item"/>');

    // Wrap item text with tag and add classes unless we are separating parent links
    if ((!settings.allowParentLinks || settings.nestedParentLinks) || !containsAnchor) {
        wrapAndAddClasses(a, wrapElement);
    } else {
        wrapParentLink(a);
    }

    setMenuState(item);

    // Create parent arrow, wrap with link if parent links and separating
    var arrowElement = $('<span class="' + prefix + '_arrow">' + (settings.showChildren ? settings.openedSymbol : settings.closedSymbol) + '</span>');

    if (settings.allowParentLinks && !settings.nestedParentLinks && containsAnchor) {
        arrowElement = arrowElement.wrap(wrapElement).parent();
    }

    // Append arrow
    $(a).last().after(arrowElement);
}

function wrapAndAddClasses(nodes, wrapElement) {
    var $wrap = $(nodes).wrapAll(wrapElement).parent();
    $wrap.addClass(prefix + '_row');
}

function wrapParentLink(nodes) {
    $(nodes).wrapAll('<span class="' + prefix + '_parent-link ' + prefix + '_row"/>').parent();
}

function setMenuState(item) {
    if (!settings.showChildren) {
        item.addClass(prefix + '_collapsed');
    } else {
        item.addClass(prefix + '_open');
    }
    item.addClass(prefix + '_parent');
}


