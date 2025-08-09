package nl.onnoh.bdg.bpmn.model.definitions;

import lombok.Data;

import java.util.Map;

@Data
public class Message {
    String id;
    String name;
    Map<String, Object> extensions;
}
