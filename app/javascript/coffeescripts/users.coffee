person = prompt "Please enter your name."
field = document.getElementById "field" 
logs = document.getElementById "logs"
boxes = document.getElementsByClassName "box" 
danger_zone_cnt = 1

generate_danger_zone = ->
    for [1..10]
        random_size = Math.floor(Math.random() * 30)+20
        y_loc = Math.floor(Math.random() * 525)+50
        x_loc = Math.floor(Math.random() * 950)
        danger_zone = document.createElement "P" 
        danger_zone.className = "box"
        danger_zone.id = danger_zone_cnt
        danger_zone.setAttribute "style",
            "width: #{random_size}px;" +
            "height: #{random_size}px;" +
            "left: #{x_loc}px;" +
            "top: #{y_loc}px;"
        
        field.appendChild danger_zone
        danger_zone_cnt++ 

generate_danger_zone()

document
    .getElementById "field" 
    .addEventListener "click", () ->
        log = document.createElement("P");  
        log.textContent = "You clicked a safe zone! X: " + event.clientX + "Y: " + event.clientY + ".";  
        logs.appendChild(log);
        return 

get_boxes = ->
    for i in [0...boxes.length]
        boxes[i].addEventListener "click", () ->
            event.stopPropagation();
            alert "Aww sorry, #{person}! You detonated a bomb." 
            field.innerHTML = ""
            logs.innerHTML = ""
            generate_danger_zone()
            boxes = document.getElementsByClassName "box"
            console.log boxes
            get_boxes()
            return
    return

get_boxes()
