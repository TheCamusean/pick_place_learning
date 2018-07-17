// Auto-generated. Do not edit!

// (in-package grasping_gym_actions.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class makeEnvStepRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action = null;
      this.step_n = null;
    }
    else {
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = [];
      }
      if (initObj.hasOwnProperty('step_n')) {
        this.step_n = initObj.step_n
      }
      else {
        this.step_n = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type makeEnvStepRequest
    // Serialize message field [action]
    bufferOffset = _arraySerializer.float32(obj.action, buffer, bufferOffset, null);
    // Serialize message field [step_n]
    bufferOffset = _serializer.int32(obj.step_n, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type makeEnvStepRequest
    let len;
    let data = new makeEnvStepRequest(null);
    // Deserialize message field [action]
    data.action = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [step_n]
    data.step_n = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.action.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasping_gym_actions/makeEnvStepRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e73a80885bb50ae7505618dd3d48bcbf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] action
    int32 step_n
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new makeEnvStepRequest(null);
    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = []
    }

    if (msg.step_n !== undefined) {
      resolved.step_n = msg.step_n;
    }
    else {
      resolved.step_n = 0
    }

    return resolved;
    }
};

class makeEnvStepResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
      this.next_state = null;
      this.reward = null;
      this.done = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
      if (initObj.hasOwnProperty('next_state')) {
        this.next_state = initObj.next_state
      }
      else {
        this.next_state = [];
      }
      if (initObj.hasOwnProperty('reward')) {
        this.reward = initObj.reward
      }
      else {
        this.reward = 0.0;
      }
      if (initObj.hasOwnProperty('done')) {
        this.done = initObj.done
      }
      else {
        this.done = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type makeEnvStepResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    // Serialize message field [next_state]
    bufferOffset = _arraySerializer.float32(obj.next_state, buffer, bufferOffset, null);
    // Serialize message field [reward]
    bufferOffset = _serializer.float32(obj.reward, buffer, bufferOffset);
    // Serialize message field [done]
    bufferOffset = _serializer.bool(obj.done, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type makeEnvStepResponse
    let len;
    let data = new makeEnvStepResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [next_state]
    data.next_state = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [reward]
    data.reward = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [done]
    data.done = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.message.length;
    length += 4 * object.next_state.length;
    return length + 14;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasping_gym_actions/makeEnvStepResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e072d6ea85c979393a2a96f8d862c21b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    float32[] next_state
    float32 reward
    bool done
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new makeEnvStepResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    if (msg.next_state !== undefined) {
      resolved.next_state = msg.next_state;
    }
    else {
      resolved.next_state = []
    }

    if (msg.reward !== undefined) {
      resolved.reward = msg.reward;
    }
    else {
      resolved.reward = 0.0
    }

    if (msg.done !== undefined) {
      resolved.done = msg.done;
    }
    else {
      resolved.done = false
    }

    return resolved;
    }
};

module.exports = {
  Request: makeEnvStepRequest,
  Response: makeEnvStepResponse,
  md5sum() { return 'c712a2155849fa75c27303831b1cb309'; },
  datatype() { return 'grasping_gym_actions/makeEnvStep'; }
};
