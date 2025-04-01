// Auto-generated. Do not edit!

// (in-package my_custom_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Motion {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.move_x = null;
      this.move_y = null;
    }
    else {
      if (initObj.hasOwnProperty('move_x')) {
        this.move_x = initObj.move_x
      }
      else {
        this.move_x = 0;
      }
      if (initObj.hasOwnProperty('move_y')) {
        this.move_y = initObj.move_y
      }
      else {
        this.move_y = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Motion
    // Serialize message field [move_x]
    bufferOffset = _serializer.int32(obj.move_x, buffer, bufferOffset);
    // Serialize message field [move_y]
    bufferOffset = _serializer.int32(obj.move_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Motion
    let len;
    let data = new Motion(null);
    // Deserialize message field [move_x]
    data.move_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [move_y]
    data.move_y = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_custom_pkg/Motion';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a4a87f7185f394984e658d3952988396';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 move_x
    int32 move_y
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Motion(null);
    if (msg.move_x !== undefined) {
      resolved.move_x = msg.move_x;
    }
    else {
      resolved.move_x = 0
    }

    if (msg.move_y !== undefined) {
      resolved.move_y = msg.move_y;
    }
    else {
      resolved.move_y = 0
    }

    return resolved;
    }
};

module.exports = Motion;
