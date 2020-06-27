{% extends "layouts/base.volt" %}

{% block content %}
    <div class="container">
        <div class="row card-panel">

            <div class="container">
                    <img src="{{item[1].image}}"style="height: 288px; width:500px; horizontal-align:middle" alt="" srcset="">
            </div>
            
            <div class="col s12 m12">
                <h4>Detail</h4>
                <table>
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <td>{{item[1].name}}</td>
                        </tr>
                        <tr>
                            <th>Price</th>
                            <td>{{item[1].price}}</td>
                        </tr>
                        <tr>
                            <th>Dimension</th>
                            <td>{{item[1].dimension}}</td>
                        </tr>
                        <tr>
                            <th>Colours</th>
                            <td>{{item[1].colours}}</td>
                        </tr>
                        <tr>
                            <th>Material</th>
                            <td>{{item[1].material}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

{% endblock %}