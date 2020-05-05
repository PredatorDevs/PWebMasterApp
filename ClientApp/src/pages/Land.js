import React, { Component } from 'react';
import { Button } from 'reactstrap';

export class Land extends Component {
    static displayName = Land.name;

    render() {
        return (
            <div>
                <h1>Bienvenido a mi aplicación de prueba</h1>
                <p>Esta aplicación está desarrollada con .NET Core y React JS</p>
                
                <p>Para ver el Dashboard, presiona el siguiente botón:</p>

                <Button color="primary">Ir al Dashboard</Button>
            </div>
        );
    }
}
