$(document).ready(function () {
    var max_milestones = 10; //maximum milestone allowed
    var container = $(".mile"); //milestone container
    var add_milestone = $("#add-more"); //Add-milestone ID

    var count = 1; //initial milestone container count
    $(add_milestone).click(function (e) { //on add milestone button click
        e.preventDefault();
        if (count < max_milestones) { //max milestone allowed
            count++; // milestone box increment
            $(container).append('<div class="mile"><input type="text" class="form-control" class="Milestone" id="milestone" placeholder="Milestone"/><a href="#" class="remove_field">Remove</a>'); //add milestone field
        }
    });

    $(container).on("click", ".remove_field", function (e) { //to remove milestone
        e.preventDefault();
        $(this).parent('div').remove();
        count--;
    })
});







