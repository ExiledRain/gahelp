function getIndex(list, id) {
    for (var i = 0; i < list.length; i++) {
        if (list[i].id === id) {
            return i;
        }
    }

    return -1;
}
let customActions = {
    getAll: {method: 'GET', url: '/horse/all'},
    addOne: {method: 'POST', url: '/horse/add'},
    updateOne: {method: 'PUT', url: '/horse/update'},
    getOne: {method: 'GET', url: '/horse/get{/id}'},
    deleteOne: {method: 'DELETE', url: '/horse/delete{/id}'}
}

let horseApi = Vue.resource('/horse/all', {}, customActions);

Vue.component('horse-form',{
    props: ['horses','horseAttr'],
    data: function() {
        return {
            description: '',
            name: '',
            id: ''
        }
    },
    watch: {
        horseAttr: function(newVal, oldVal) {
            this.name = newVal.name;
            this.description = newVal.description;
            this.id = newVal.id;
        }
    },
    template:
        '<div style="border: 1px lightgray solid; margin: 10px; padding: 5px">' +
          '<input type="text" placeholder="Enter name" v-model="name"/>' +
          '<input type="text" placeholder="Enter description" v-model="description"/>' +
         '<input type="button" value="Save" v-on:click="save"/> ' +
        '</div>',
    methods: {
        save: function () {
            let horse = { name: this.name, description: this.description, id: this.id};

            if (this.id) {
                horseApi.updateOne({},horse).then(result =>
                    result.json().then(data => {
                        let index = getIndex(this.horses,data.id);
                        this.horses.splice(index, 1, data);
                        this.id = '';
                        this.name = '';
                        this.description = '';
                    }))
            } else {
                horseApi.addOne({}, horse).then(result =>
                    result.json().then(data => {
                        this.horses.push(data);
                        this.name = '';
                        this.description = ''
                    })
                )
            }
        }
    }
})

Vue.component('horse-row', {
    props: ['horse','editHorse','horses'],
    template:
        '<tr>' +
        '<td><i>{{ horse.id }}</i></td>' +
        '<td> {{ horse.name }} </td>' +
        '<td> {{ horse.description }}</td>' +
        '<td style="border-bottom: 1px gray solid; border-radius: 10%">' +
        // '<span style="position: absolute; right: 0">' +
        '<input type="button" value="Edit" v-on:click="edit">' +
        '<input type="button" value="X" v-on:click="del">' +
        // '</span>' +
        '</td>' +
        '</tr>',
    methods: {
        edit: function () {
            this.editHorse(this.horse)
        },
        del: function () {
            horseApi.deleteOne({id: this.horse.id}).then(result => {
                if (result.ok) {
                    this.horses.splice(this.horses.indexOf(this.horse),1)
                }
            })
        }
    }
})

Vue.component('horses-list', {
    props: ['horses'],
    data: function() {
        return {
            horse: null
        };
    },
    template:
        '<div style="width: 50%;v-align: center">' +
        '<horse-form :horses="horses" :horseAttr="horse"/>' +
        '<table>' +
        '<tr>' +
            '<td>Id:</td>' +
            '<td>Name:</td>' +
            '<td>Description:</td>' +
            '<td style="border: none"></td>' +
        '</tr>' +
        '<horse-row v-for="horse in horses" :key="horse.id" :horse="horse" ' +
        ':horses="horses" :editHorse="editHorse"/>' +
        '</table>' +
        '</div>',
    created: function () {
        horseApi.get().then(result =>
            result.json().then(data =>
                data.forEach(horse => this.horses.push(horse))
            )
        )},
    methods: {
        editHorse: function (horse) {
            this.horse = horse
        }
    }
})

var app = new Vue({
    el: '#app',
    template: '<horses-list :horses="horses"/>',
    data: {
        horses: []
    }
})