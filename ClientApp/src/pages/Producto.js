import React, { Component } from 'react';
import { Breadcrumb, BreadcrumbItem, Button, Form, FormGroup, Label, Input, FormText, Collapse, InputGroup, InputGroupAddon, Row, Col  } from 'reactstrap';
import { Modal, Switch, Select, Button as AntdButton, notification, Tag, Spin, Popconfirm } from 'antd';
import axios from 'axios';
import { DeleteOutlined, EditOutlined, ExclamationCircleOutlined } from '@ant-design/icons';

import 'antd/dist/antd.css';

const { Option } = Select;
const { confirm } = Modal;

export class Producto extends Component {
  static displayName = Producto.name;

  constructor(props) {
    super(props);
    this.state = this.getInitialState();
  }

  componentDidMount() {
    this.obtenerListaProductos();
    this.obtenerListaCategorias();
  }

  getInitialState = () => {
    const initState = {
      categorias: [],
      productos: [],
      loading: true,
      openForm: false,
      categorySelected: '',
      nombre: '',
      descripcion: '',
      costo: '',
      precio: '',
      descuento: '',
      descuentoActivo: false,
      existencias: ''
    }
    return initState;
  }

  restoreState = () => {
    this.setState({
      openForm: false,
      loading: false,
      categorySelected: '',
      nombre: '',
      descripcion: '',
      costo: '',
      precio: '',
      descuento: '',
      descuentoActivo: false,
      existencias: ''
    });
  }

  buildDataToSend = () => {
    const {
      categorySelected,
      nombre,
      descripcion,
      costo,
      precio,
      descuento,
      descuentoActivo,
      existencias,
    } = this.state;
    const data = {
      categoria: categorySelected,
      nombre,
      descripcion,
      costo,
      precio,
      descuento,
      descuentoActivo,
      existencias,
    }
    return data;
  }

  validateData = () => {
    const {
      categorySelected,
      nombre,
      descripcion,
      costo,
      precio,
      descuento,
      descuentoActivo,
      existencias,
    } = this.state;
    if (
      categorySelected
      && nombre
      && descripcion
      && costo
      && precio
      && descuento
      && existencias
    ) {
      return true;
    }
    else {
      notification.error({
        message: 'Datos inválidos',
        description:
          'Por favor complete los campos',
        onClick: () => { },
        style: {
          backgroundColor: '#FCDDDA',
        },
        duration: 2.5,
      })
      return false;
    }
  }

  addProductAction = () => {
    if (this.validateData()) {
      this.setState({ loading: true })
      axios.post('api/producto', this.buildDataToSend())
      .then((response) => {
        console.log(response);
        this.restoreState();
        this.obtenerListaProductos();
        notification.success({
          message: 'Producto guardado',
          description:
            'El producto fue guardado en la BD',
          onClick: () => { },
          style: {
            backgroundColor: '#DBECE1',
          },
          duration: 2.5,
        })
      })
      .catch((err) => {
        this.setState({ loading: true })
        notification.error({
          message: 'Algo salió mal',
          description:
            'Verifica tu conexión',
          onClick: () => { },
          style: {
            backgroundColor: '#FCDDDA',
          },
          duration: 2.5,
        })
      });
    }
  }

  deleteProductoAction = (id) => {
    this.setState({ loading: true })
    axios.delete(`api/producto/${id}`, this.buildDataToSend())
    .then((response) => {
      console.log(response);
      this.obtenerListaProductos();
      notification.success({
        message: 'Producto eliminado',
        description:
          'El producto fue eliminado de la BD',
        onClick: () => { },
        style: {
          backgroundColor: '#DBECE1',
        },
        duration: 2.5,
      })
    })
    .catch((err) => {
      this.setState({ loading: true })
      notification.error({
        message: 'Algo salió mal',
        description:
          'Verifica tu conexión',
        onClick: () => { },
        style: {
          backgroundColor: '#FCDDDA',
        },
        duration: 2.5,
      })
    });
  }

  renderBreadcrumbs = () => {
    return (
      <div>
        <Breadcrumb>
          <BreadcrumbItem>
            {
              this.state.openForm ? (
                <Button 
                  color={"secondary"} 
                  onClick={() => this.restoreState()}
                >
                  {"Cancelar"}
                </Button>
              ) : (
                <Button 
                  color={"success"} 
                  onClick={() => this.setState({ openForm: true })}
                >
                  {"Nuevo"}
                </Button>
              )
            }
          </BreadcrumbItem>
        </Breadcrumb>
      </div>
    );
  };

  onHandleCategorySelected = (value) => {
    this.setState({ categorySelected: value })
  }

  onChangeForm = (e) => {
    this.setState({
      [e.target.name]: e.target.value,
    })
  }

  onChangeNumber = (e) => {
    if (+e.target.value) {
      this.setState({
        [e.target.name]: +e.target.value,
      })
    }
  }

  onChangeDescuento = (value) => {
    this.setState({ descuentoActivo: value })
  }

  renderForm = () => {
    const {
      categorias,
      productos,
      loading,
      categorySelected,
      nombre,
      descripcion,
      costo,
      precio,
      descuento,
      descuentoActivo,
      existencias,
    } = this.state;
    return (
      <Form>
        <Row form>
          <Col md={6}>
            <FormGroup>
              <Label for="exampleSelect">Categoría</Label>
              <p style={{ margin: 0 }}></p>
              <Select value={categorySelected} defaultValue={''} style={{ width: '100%' }} onChange={this.onHandleCategorySelected}>
                <Option value={''} disabled>{'Seleccione categoría'}</Option>
                {
                  this.state.categorias.map((categoria) => {
                    return (
                      <Option key={categoria.id} value={categoria.id}>{categoria.descripcion}</Option>
                    )
                  })
                }
              </Select>
            </FormGroup>
          </Col>
          <Col md={6}>
            <FormGroup>
              <Label for="exampleText">Nombre</Label>
              <Input type="text" name="nombre" value={nombre} onChange={this.onChangeForm} />
            </FormGroup>
          </Col>
        </Row>
        <FormGroup>
          <Label for="exampleText">Descripcion</Label>
          <Input type="textarea" name="descripcion" value={descripcion} onChange={this.onChangeForm}/>
        </FormGroup>
        <Row form>
          <Col md={3}>
            <FormGroup>
              <Label for="exampleText">Costo</Label>
              <InputGroup>
                <InputGroupAddon addonType="prepend">$</InputGroupAddon>
                <Input name="costo" value={costo} min={0} type="number" step="0.01" onChange={this.onChangeNumber}/>
              </InputGroup>
            </FormGroup>
          </Col>
          <Col md={3}>
            <FormGroup>
              <Label for="exampleText">Precio</Label>
              <InputGroup>
                <InputGroupAddon addonType="prepend">$</InputGroupAddon>
                <Input name="precio" value={precio} min={0} type="number" step="0.01" onChange={this.onChangeNumber}/>
              </InputGroup>
            </FormGroup>
          </Col>
          <Col md={3}>
            <FormGroup>
              <Label for="exampleText">Descuento</Label>
              <InputGroup>
                <InputGroupAddon addonType="prepend">$</InputGroupAddon>
                <Input name="descuento" value={descuento} min={0} type="number" step="0.01" onChange={this.onChangeNumber}/>
              </InputGroup>
            </FormGroup>
          </Col>
          <Col md={3}>
            <FormGroup>
              <Label for="exampleText">Existencias</Label>
              <InputGroup>
                <InputGroupAddon addonType="prepend">♦</InputGroupAddon>
                <Input name="existencias" value={existencias} min={0} type="number" step="0.01" onChange={this.onChangeNumber}/>
              </InputGroup>
            </FormGroup>     
          </Col>
        </Row>
        <FormGroup>
          <Label for="exampleText">Descuento Activo</Label>{'   '}
          <Switch onChange={this.onChangeDescuento} />
        </FormGroup>
        {
          loading ? <Spin /> : <Button color="primary" onClick={() => this.addProductAction()}>Guardar</Button>
        }
      </Form>
    );
  }

  static renderProductosData(productos) {
    console.log(productos);
    return (
      <table className='table table-striped table-bordered table-responsive' aria-labelledby="tabelLabel">
        <thead className="thead-dark">
          <tr>
            {/* <th>ID</th>  */}
            <th>Nombre</th>
            <th style={{ width: '30%'}}>Descripcion</th>
            <th>Precio</th>
            <th>Costo</th>
            <th>Descuento</th>
            <th>Desc. Activo</th>
            <th>Existencias</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {productos.map(producto =>
            <tr key={producto.id}>
              {/* <td>{producto.id}</td> */}
              <td>{producto.nombre}</td>
              <td>{producto.descripcion}</td>
              <td>{`$ ${producto.precio}`}</td>
              <td>{`$ ${producto.costo}`}</td>
              <td>{`$ ${producto.descuento}`}</td>
              <td>{producto.descuentoActivo ? <Tag color="green">Activo</Tag> : <Tag color="red">Inactivo</Tag>}</td>
              <td>{producto.existencias}</td>
              <td>
                {
                  <div style={{display: 'flex', flexDirection: 'row'}}>
                    <AntdButton
                      shape="round"
                      type="primary"
                      icon={<EditOutlined />}
                      onClick={() => {
                        Modal.info({
                          title: 'Función no implementada',
                          content: (
                            <div>
                              <p>Función en desarrollo</p>
                            </div>
                            ),
                          okText: 'Aceptar',
                          onOk() { },
                        });
                      }}
                    />
                    <p></p>
                    <AntdButton
                      shape="round"
                      type="primary"
                      danger
                      icon={<DeleteOutlined />}
                      onClick={() => {
                        Modal.info({
                          title: 'Función no implementada',
                          content: (
                            <div>
                              <p>Función en desarrollo</p>
                            </div>
                          ),
                          okText: 'Aceptar',
                          onOk() { },
                        });
                      }}
                    />
                  </div>
                }
              </td>
            </tr>
          )}
        </tbody>
      </table>
    );
  }

  render() {
    let contents = this.state.loading
      ? <p><em>Cargando...</em></p>
      : Producto.renderProductosData(this.state.productos);
    return (
      <div>
        <h1 id="tabelLabel">Productos</h1>
        <p>Este componente consume los datos desde la API que conecta a la base de datos en SQL Server</p>
        {this.renderBreadcrumbs()}
        <div style={{ padding: 15 }}>
          <Collapse isOpen={this.state.openForm}>
            {this.renderForm()}
          </Collapse>
        </div>
        {contents}
      </div>
    );
  }

  async obtenerListaProductos() {
    const response = await fetch('api/producto');
    const data = await response.json();
    this.setState({ productos: data, loading: false });
  }

  async obtenerListaCategorias() {
    const response = await fetch('api/categoria');
    const data = await response.json();
    this.setState({ categorias: data, loading: false });
  }
}
