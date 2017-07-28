{include file="_top.tpl"}

<div id="map_div" style="height: 400px;"></div>

<script>
{literal}

  var markers = [
    {
      title: 'Marker 0',
      description: '<p>Content 0 <a href="/custom_map">link 0</a></p>',
      latitude: 53.808678,
      longitude: -117.918921
    },
    {
      title: 'Marker 1',
      description: '<p>Content 1 <a href="/custom_map">link 1</a></p>',
      latitude: 33.818038,
      longitude: -102.928492
    },
    {
      title: 'Marker 2',
      description: '<p>Content 2 <a href="/custom_map">link 2</a></p>',
      latitude: 44.803333,
      longitude: 14.915278
    },
    {
      title: 'Marker 3',
      description: '<p>Content 3 <a href="/custom_map">link 3</a></p>',
      latitude: 34.803333,
      longitude: 135.915278
    }
  ];

{/literal}
</script>

<script async defer type="text/javascript" src="/custom_map.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_iT9HtpuNxKcK9uMtUeU3Fu2EmfMEDDg&callback=initMap"></script>

{include file="_bottom.tpl"}
