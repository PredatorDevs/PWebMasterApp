import React, { Component } from 'react';
import { Button } from 'reactstrap';
import styled from 'styled-components';

export class Dashboard extends Component {
    static displayName = Dashboard.name;

    render() {
        return (
            <Wrapper>
                <div className="left-side">
                    <h1>ASD</h1>
                </div>
                <div className="right-side">
                    <h1>ASD</h1>
                </div>
            </Wrapper>
        );
    }
}

const Wrapper = styled.div`
    background-color: #C3C3C3;
    display: flex;
    flex-direction: row;
    .left-side {
        background-color: #3A3D42;
        width: 25%;
    }
    .right-side {
        background-color: #6CB6F5;
        width: 75%;
    }
`;