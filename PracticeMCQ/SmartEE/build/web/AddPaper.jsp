<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@include file="Header.jsp" %>

<div class="container">
    <div class="col-xs-10 col-md-6 col-xs-offset-1 col-md-offset-3">
        <div class="row">
            <nav aria-label="...">
                <ul class="pager" role="tablist">
                    <li class="previous" onclick="goTo(1);"><a href="#"><span aria-hidden="true">?</span> Previous</a></li>
                    <li class="active" id="first">
                        <a aria-controls="tab1" data-toggle="tab" href="#tab1" role="tab">1</a>
                    </li>
                    <li>
                        <a aria-controls="tab2" data-toggle="tab" href="#tab2" role="tab">2</a>
                    </li>
                    <li>
                        <a aria-controls="tab3" data-toggle="tab" href="#tab3" role="tab">3</a>
                    </li>
                    <li>
                        <a aria-controls="tab4" data-toggle="tab" href="#tab4" role="tab">4</a>
                    </li>
                    <li id="last">
                        <a aria-controls="tab5" data-toggle="tab" href="#tab5" role="tab">5</a>
                    </li>                    
                    <li class="next" onclick="goTo(2);"><a href="#">Next <span aria-hidden="true">?</span></a></li>
                </ul>
            </nav>
        </div>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="tab1" role="tabpanel">
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 1</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id dolor
                                id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 2</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id
                                dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="tab2" role="tabpanel">
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 3</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id dolor
                                id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 4</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id
                                dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="tab3" role="tabpanel">
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 5</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id dolor
                                id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 6</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id
                                dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="tab4" role="tabpanel">
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 7</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id dolor
                                id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 8</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id
                                dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="tab5" role="tabpanel">
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 9</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id dolor
                                id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="thumbnail">
                        <img alt="..." src="http://placehold.it/240x150">
                        <div class="caption">
                            <h3>Thumbnail label 10</h3>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
                                Donec id elit non mi porta gravida at eget metus. Nullam id
                                dolor id nibh ultricies vehicula ut id elit.</p>
                            <p><a class="btn btn-primary" href="#" role="button">Read more
                                    ...</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div
<script>
    function goTo(number) {
        $('ul.pager li:eq(' + number + ') a').tab('show');
        upgradePreNext(number);
    }
    function upgradePreNext(number) {
        if (number > 1) {
            $('ul.pager li:eq(0)').attr("onclick", "goTo(" + (number - 1) + ")");
            $('ul.pager li:eq(0)').attr("class", "previous");
        } else {
            $('ul.pager li:eq(0)').attr("class", "disabled");
        }
        if (number < 5) {
            $('ul.pager li:eq(6)').attr("onclick", "goTo(" + (number + 1) + ")");
            $('ul.pager li:eq(6)').attr("class", "next");
        } else {
            $('ul.pager li:eq(6)').attr("class", "disabled");
        }
    }
    $(document).ready(function () {
        $('li a').on('click', function (e) {
            goTo((e.target.innerHTML) - 0);
        });
    });
</script>