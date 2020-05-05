import React, { Component } from 'react';

export class Cliente extends Component {
    static displayName = Cliente.name;

    constructor(props) {
        super(props);
        this.state = { clientes: [], loading: true };
    }

    componentDidMount() {
        this.populateWeatherData();
    }

    static renderForecastsTable(clientes) {
        return (
            <table className='table table-striped' aria-labelledby="tabelLabel">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>DUI</th>
                        <th>NIT</th>
                        <th>Fecha Creacion</th>
                        <th>Ultima Actualizaciona</th>
                    </tr>
                </thead>
                <tbody>
                    {clientes.map(forecast =>
                        <tr key={forecast.id}>
                            <td>{forecast.id}</td>
                            <td>{forecast.nombres}</td>
                            <td>{forecast.apellidos}</td>
                            <td>{forecast.dui}</td>
                            <td>{forecast.nit}</td>
                            <td>{forecast.fechaCreacion}</td>
                            <td>{forecast.ultimaActualizacion}</td>
                        </tr>
                    )}
                </tbody>
            </table>
        );
    }

    render() {
        let contents = this.state.loading
            ? <p><em>Loading...</em></p>
            : Cliente.renderForecastsTable(this.state.clientes);
        console.log(this.state.clientes)
        return (
            <div>
                <h1 id="tabelLabel">Clientes</h1>
                <p>Informacion de los clientes proveniente de la BD en SQL Server.</p>
                {contents}
            </div>
        );
    }

    async populateWeatherData() {
        const response = await fetch('api/cliente');
        const data = await response.json();
        this.setState({ clientes: data, loading: false });
    }
}
